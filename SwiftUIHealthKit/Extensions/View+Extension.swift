//
//  View+Extension.swift
//  SwiftUIHealthKit
//
//  Created by Quang Pham on 05/08/2022.
//

import Foundation
import SwiftUI

extension View {
    func hideKeyboard() {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
}