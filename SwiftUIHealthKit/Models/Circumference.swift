//
//  Circumference.swift
//  SwiftUIHealthKit
//
//  Created by Quang Pham on 04/08/2022.
//

import Foundation

struct Circumference {
    var neck: Double?
    var waist: Double?
    var wrist: Double?
    var hip: Double?
    
    mutating func reset() {
        neck = nil
        waist = nil
        wrist = nil
        hip = nil
    }
}
