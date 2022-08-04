//
//  Diseases.swift
//  SwiftUIHealthKit
//
//  Created by Quang Pham on 04/08/2022.
//

import Foundation

struct Diseases {
    var heartAttack: Bool?
    var stroke: Bool?
    var diabetes: Bool?
    var mammaryGlandCancer: Bool?
    
    mutating func reset() {
        heartAttack = nil
        stroke = nil
        diabetes = nil
        mammaryGlandCancer = nil
    }
}
