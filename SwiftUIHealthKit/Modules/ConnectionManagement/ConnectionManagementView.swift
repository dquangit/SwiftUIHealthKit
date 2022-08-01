//
//  ConnectionManagementView.swift
//  SwiftUIHealthKit
//
//  Created by Quang Pham on 01/08/2022.
//

import SwiftUI

struct ConnectionManagementView: View {
    
    @StateObject private var viewModel = ConnectionManagementViewModel()
    
    private let tabbarItems = [
        TabbarItem(title: "applications".localized),
        TabbarItem(title: "devices".localized)
    ]
    
    private let applicationItems = [
        ApplicationViewItem(
            id: ImageAssets.googleFit.rawValue,
            asset: ImageAssets.googleFit.rawValue,
            title: "google_fit".localized
        ),
        ApplicationViewItem(
            id: ImageAssets.samsungFit.rawValue,
            asset: ImageAssets.samsungFit.rawValue,
            title: "samsung_health".localized
        ),
        ApplicationViewItem(
            id: ImageAssets.garmin.rawValue,
            asset: ImageAssets.garmin.rawValue,
            title: "garmin_connect".localized
        ),
        ApplicationViewItem(
            id: ImageAssets.appleHealth.rawValue,
            asset: ImageAssets.appleHealth.rawValue,
            title: "apple_health".localized
        ),
    ]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                CustomTabbarView(
                    index: $viewModel.tabIndex,
                    tabbarItems: tabbarItems
                )
                .background(AppColor.dodgerBlue)
                TabView(selection: $viewModel.tabIndex) {
                    VStack {
                        ApplicationView(
                            items: applicationItems,
                            selectedId: $viewModel.appId
                        )
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("connect")
                                .font(.system(size: 18).bold())
                                .foregroundColor(viewModel.buttonEnabled ? .white : AppColor.manateeapprox)
                                .padding(.horizontal, 55)
                                .padding(.vertical, 16)
                        }
                        .background(viewModel.buttonEnabled ? AppColor.dodgerBlue : AppColor.mercucy)
                        .disabled(!viewModel.buttonEnabled)
                        .cornerRadius(12)
                        .animation(.default, value: viewModel.buttonEnabled)
                        .padding()
                        Spacer()
                    }
                    .tag(0)
                    Text("Not implemented")
                    .tag(1)
                }
                .tabViewStyle(PageTabViewStyle())
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            .navigationTitle("manage_connections".asLocalizedKey)
        }
    }
}

struct ConnectionManagementView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectionManagementView()
    }
}