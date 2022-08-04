//
//  GeneralInfo.swift
//  SwiftUIHealthKit
//
//  Created by Quang Pham on 04/08/2022.
//

import Foundation

struct GeneralInfo {
    var name: String = ""
    var weight: Double?
    var gender: Gender?
    var birthday: Date?
    var weightUnit: WeightUnit? = .kilogram
    
    mutating func reset() {
        weight = nil
        name = ""
        gender = nil
        weightUnit = .kilogram
    }
}
