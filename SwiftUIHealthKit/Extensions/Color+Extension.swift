//
//  Color+Extension.swift
//  SwiftUIHealthKit
//
//  Created by Quang Pham on 01/08/2022.
//

import Foundation
import SwiftUI

extension Color {
    init(_ r: Int, _ g: Int, _ b: Int, opacity: Double = 1) {
        self.init(
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: opacity
        )
    }
}
