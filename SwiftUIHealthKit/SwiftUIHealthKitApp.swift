//
//  SwiftUIHealthKitApp.swift
//  SwiftUIHealthKit
//
//  Created by Quang Pham on 01/08/2022.
//

import SwiftUI

@main
struct SwiftUIHealthKitApp: App {
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(AppColor.dodgerBlue)
        appearance.shadowColor = .clear
        appearance.largeTitleTextAttributes =  [
            .foregroundColor: UIColor.white,
            .font: UIFont.boldSystemFont(ofSize: 24)
        ]
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some Scene {
        WindowGroup {
            ConnectionManagementView()
        }
    }
}
