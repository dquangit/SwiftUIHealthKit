//
//  ConnectionManagementViewModel.swift
//  SwiftUIHealthKit
//
//  Created by Quang Pham on 01/08/2022.
//

import Foundation
import SwiftUI

class ConnectionManagementViewModel: ViewModel {
    
    let service: HealthService
    
    @Published private(set) var applicationItems = [
        ApplicationViewItem(
            id: ImageAssets.googleFit.rawValue,
            asset: ImageAssets.googleFit.rawValue,
            title: "google_fit".localized,
            enabled: false
        ),
        ApplicationViewItem(
            id: ImageAssets.samsungFit.rawValue,
            asset: ImageAssets.samsungFit.rawValue,
            title: "samsung_health".localized,
            enabled: false
        ),
        ApplicationViewItem(
            id: ImageAssets.garmin.rawValue,
            asset: ImageAssets.garmin.rawValue,
            title: "garmin_connect".localized,
            enabled: false
        ),
        ApplicationViewItem(
            id: ImageAssets.appleHealth.rawValue,
            asset: ImageAssets.appleHealth.rawValue,
            title: "apple_health".localized,
            enabled: false
        ),
    ]
    
    @Published var tabIndex: Int = 0
    @Published var appId: String? {
        didSet {
            buttonEnabled = appId != nil
        }
    }
    @Published private(set) var buttonEnabled = false
    @Published private(set) var userMedical: UserMedical?
    @Published var gotoMedicalView = false
    
    init(service: HealthService) {
        self.service = service
    }
    
    func sync() async {
        do {
           let result = try await service.getUserMedicalInfo()
            print(result.debugDescription)
            userMedical = result
            gotoMedicalView = true
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func checkHealthAvailability() async {
        let healthAvailability = await service.checkAvailability()
        applicationItems = applicationItems.map { item in
            if item.id == ImageAssets.appleHealth.rawValue {
                return ApplicationViewItem(
                    id: ImageAssets.appleHealth.rawValue,
                    asset: ImageAssets.appleHealth.rawValue,
                    title: "apple_health".localized,
                    enabled: healthAvailability
                )
            }
            return item
        }
    }
}
