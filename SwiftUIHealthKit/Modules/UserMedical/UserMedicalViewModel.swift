//
//  UserMedicalViewModel.swift
//  SwiftUIHealthKit
//
//  Created by Quang Pham on 01/08/2022.
//

import Foundation
import Combine

class UserMedicalViewModel: ViewModel {
    @Published var tabIndex = 0
    
    @Published var height: Double?
    @Published var heartRate: Double?
    @Published var cholestrol: Double?
    @Published var glucoseLevel: Double?
    @Published var neck: Double?
    @Published var waist: Double?
    @Published var wrist: Double?
    @Published var hip: Double?
    @Published var name: String
    @Published var weight: Double?
    @Published var gender: Gender?
    @Published var birthday: Date?
    @Published var weightUnit: WeightUnit?
    @Published var heartAttack: Bool?
    @Published var stroke: Bool?
    @Published var diabetes: Bool?
    @Published var mammaryGlandCancer: Bool?
    
    @Published var clearButtonEnabled = false
    @Published var saveButtonEnabled = false
    
    init(userMedical: UserMedical) {
        
        let measurement = userMedical.measurement
        self.height = measurement.height
        self.heartRate = measurement.heartRate
        self.glucoseLevel = measurement.glucoseLevel
        self.cholestrol = measurement.cholestrol
        
        let circumference = userMedical.circumference
        self.neck = circumference.neck
        self.waist = circumference.waist
        self.wrist = circumference.wrist
        self.hip = circumference.hip
        
        let generalInfo = userMedical.generalInfo
        name = generalInfo.name
        weight = generalInfo.weight
        gender = generalInfo.gender
        birthday = generalInfo.birthday
        weightUnit = generalInfo.weightUnit
        
        let diseases = userMedical.diseases
        heartAttack = diseases.heartAttack
        stroke = diseases.stroke
        diabetes = diseases.diabetes
        mammaryGlandCancer = diseases.mammaryGlandCancer
    }
    
    private func setupBinding() {
     
       
    }
    
    func clearAll() {
        height = nil
        heartRate = nil
        cholestrol = nil
        glucoseLevel = nil
        neck = nil
        waist = nil
        wrist = nil
        hip = nil
        weight = nil
        gender = nil
        birthday = nil
        heartAttack = nil
        stroke = nil
        diabetes = nil
        mammaryGlandCancer = nil
        name = ""
        weightUnit = nil
        
    }
    
    func save() {
        let general = GeneralInfo(
            name: name,
            weight: weight,
            gender: gender,
            birthday: birthday,
            weightUnit: weightUnit
        )
        
        let measurement = Measurement(
            height: height,
            heartRate: heartRate,
            cholestrol: cholestrol,
            glucoseLevel: glucoseLevel
        )
        
        let circumference = Circumference(
            neck: neck,
            waist: waist,
            wrist: wrist,
            hip: hip
        )
        
        let diseases = Diseases(
            heartAttack: heartAttack,
            stroke: stroke,
            diabetes: diabetes,
            mammaryGlandCancer: mammaryGlandCancer
        )
        
        
        let userMedical = UserMedical(
            generalInfo: general,
            circumference: circumference,
            measurement: measurement,
            diseases: diseases
        )
        
        print(String(describing: userMedical))
    }
}

