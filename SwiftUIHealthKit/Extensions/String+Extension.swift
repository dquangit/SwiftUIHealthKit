//
//  String+Extension.swift
//  SwiftUIHealthKit
//
//  Created by Quang Pham on 01/08/2022.
//

import Foundation
import SwiftUI

extension String {
    var asLocalizedKey: LocalizedStringKey {
        return LocalizedStringKey(self)
    }
    
    var localized: String {
        return String(localized: String.LocalizationValue(self))
    }
}
