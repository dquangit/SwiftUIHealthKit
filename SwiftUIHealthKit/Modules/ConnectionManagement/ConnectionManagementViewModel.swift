//
//  ConnectionManagementViewModel.swift
//  SwiftUIHealthKit
//
//  Created by Quang Pham on 01/08/2022.
//

import Foundation
import SwiftUI

class ConnectionManagementViewModel: ViewModel {
    
    @Published var tabIndex: Int = 0
    @Published var appId: String? {
        didSet {
            buttonEnabled = appId != nil
        }
    }
    @Published private(set) var buttonEnabled: Bool = false
}
