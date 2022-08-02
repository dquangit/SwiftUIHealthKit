//
//  UserMedical.swift
//  SwiftUIHealthKit
//
//  Created by Quang Pham on 02/08/2022.
//

import Foundation

struct UserMedical {

    let dateOfBirth: Date?
    let gender: Gender?
    let height: Double?
    let weight: Double?
    let glucoseLevel: Double?
    let cholestrol: Double?
    let hearRate: Int?
    
    init(
        dateOfBirth: Date? = nil,
        gender: Gender? = nil,
        height: Double? = nil,
        weight: Double? = nil,
        glucoseLevel: Double? = nil,
        cholestrol: Double? = nil,
        hearRate: Int? = nil
    ) {
        self.dateOfBirth = dateOfBirth
        self.gender = gender
        self.height = height
        self.weight = weight
        self.glucoseLevel = glucoseLevel
        self.cholestrol = cholestrol
        self.hearRate = hearRate
    }

    func copyWith(
        dateOfBirth: Date? = nil,
        gender: Gender? = nil,
        height: Double? = nil,
        weight: Double? = nil,
        glucoseLevel: Double? = nil,
        cholestrol: Double? = nil,
        hearRate: Int? = nil
    ) -> UserMedical {
        return UserMedical(
            dateOfBirth: dateOfBirth ?? self.dateOfBirth,
            gender: gender ?? self.gender,
            height: height ?? self.height,
            weight: weight ?? self.weight,
            glucoseLevel: glucoseLevel ?? self.glucoseLevel,
            cholestrol: cholestrol ?? self.cholestrol,
            hearRate: hearRate ?? self.hearRate
        )
    }
}

enum Gender {
    case male, female
}
