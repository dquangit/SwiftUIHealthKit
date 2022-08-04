//
//  AppleHealthService.swift
//  SwiftUIHealthKit
//
//  Created by Quang Pham on 02/08/2022.
//

import Foundation
import HealthKit

class AppleHealthService: HealthService {
    
    private let healthStore = HKHealthStore()
    
    private let characteristicTypes = [
            HKCharacteristicType.characteristicType(forIdentifier: .dateOfBirth),
            HKCharacteristicType.characteristicType(forIdentifier: .biologicalSex),
        ].compactMap { $0 }

    private let quantitySamples = [
            HKSampleType.quantityType(forIdentifier: .height),
            HKSampleType.quantityType(forIdentifier: .bodyMass),
            HKSampleType.quantityType(forIdentifier: .heartRate),
            HKSampleType.quantityType(forIdentifier: .bloodGlucose)
        ].compactMap { $0 }
    
    
    private lazy var types: Set<HKObjectType> = Set(characteristicTypes + quantitySamples)
    
    func checkAvailability() async -> Bool {
        return HKHealthStore.isHealthDataAvailable()
    }
    
    func getUserMedicalInfo() async throws -> UserMedical? {
        if !(try await granted()) {
            try await healthStore.requestAuthorization(toShare: [], read: types)
        }
        
        let dateOfBirth = try? healthStore.dateOfBirthComponents()
        let gender = try? healthStore.biologicalSex()

        let samples = await withTaskGroup(of: HKSample?.self) { [weak self] group -> [HKQuantitySample] in
            guard let self = self else { return [] }
            var list = [HKSample?]()
            for type in self.quantitySamples {
                group.addTask {
                    await self.sampleQuery(type: type)
                }
            }
            
            for await sample in group {
                list.append(sample)
            }
            return list.compactMap { $0 as? HKQuantitySample }
        }
        
        return self.userMedical(from: samples)
            .copyWith(
                dateOfBirth: dateOfBirth?.date,
                gender: self.getGender(from: gender)
            )
    }
    
    private func granted() async throws -> Bool {
        let result = try await healthStore.statusForAuthorizationRequest(toShare: [], read: types)
        switch result {
        case .unnecessary:
            return true
        default:
            return false
        }
    }


    private func sampleQuery(type: HKSampleType) async -> HKSample? {
        let mostRecentPredicate = HKQuery.predicateForSamples(
            withStart: Date.distantPast,
            end: Date(),
            options: .strictEndDate
        )
        
        let sortDescriptor = NSSortDescriptor(
            key: HKSampleSortIdentifierStartDate,
            ascending: false
        )
        
        return await withCheckedContinuation { continuation in
            let sampleQuery = HKSampleQuery(sampleType: type,
                                            predicate: mostRecentPredicate,
                                            limit: 1,
                                            sortDescriptors: [sortDescriptor]) {
                (_, samples, error) in
                guard error == nil, let sample = samples?.first else {
                    continuation.resume(with: .success(nil))
                    return
                }
                continuation.resume(with: .success(sample))
            }
            healthStore.execute(sampleQuery)
        }
    }
    
    private func getGender(from hkObject: HKBiologicalSexObject?) -> Gender? {
        switch hkObject?.biologicalSex {
        case .male:
            return .male
        case .female:
            return .female
        default:
            return nil
        }
    }
    
    private func userMedical(from hkQuantitySamples: [HKQuantitySample]) -> UserMedical {
        var userMedical = UserMedical()
        for sample in hkQuantitySamples {
            let quantity = sample.quantity
            switch HKQuantityTypeIdentifier(rawValue: sample.quantityType.identifier) {
            case .bodyMass:
                userMedical = userMedical.copyWith(
                    weight: quantity.doubleValue(
                        for: .gramUnit(with: .kilo)
                    )
                )
            case .height:
                userMedical = userMedical.copyWith(
                    height: quantity.doubleValue(
                        for: .meterUnit(with: .centi)
                    )
                )
            case .bloodGlucose:
                userMedical = userMedical.copyWith(
                    glucoseLevel: quantity.doubleValue(
                        for: .moleUnit(
                            with: .milli,
                            molarMass: HKUnitMolarMassBloodGlucose
                        ).unitDivided(by: .liter())
                    )
                )
            case .heartRate:
                userMedical = userMedical.copyWith(
                    hearRate: Int(
                        quantity.doubleValue(
                            for: .count().unitDivided(
                                by: .minute()
                            )
                        )
                    )
                )
            default:
                break
            }
        }
        return userMedical
    }
}
