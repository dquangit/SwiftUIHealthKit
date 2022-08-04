//
//  Measurement.swift
//  SwiftUIHealthKit
//
//  Created by Quang Pham on 04/08/2022.
//

import Foundation

struct Measurement {
    var height: Double?
    var heartRate: Double?
    var cholestrol: Double?
    var glucoseLevel: Double?
    
    mutating func reset() {
        heartRate = nil
        glucoseLevel = nil
        height = nil
        cholestrol = nil
    }
}
