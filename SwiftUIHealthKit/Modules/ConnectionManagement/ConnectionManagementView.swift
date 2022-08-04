//
//  ConnectionManagementView.swift
//  SwiftUIHealthKit
//
//  Created by Quang Pham on 01/08/2022.
//

import SwiftUI

struct ConnectionManagementView: View {
    
    @StateObject private var viewModel = ConnectionManagementViewModel(
        service: AppleHealthService()
    )
    
    private let tabbarItems = [
        TabbarItem(title: "applications".localized),
        TabbarItem(title: "devices".localized)
    ]
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            CustomNavigationBar(
                title: "manage_connections".localized,
                hideBackButton: true
            ) {
                EmptyView()
            }
            CustomTabbarView(
                index: $viewModel.tabIndex,
                tabbarItems: tabbarItems
            )
            .background(AppColor.dodgerBlue)
            TabView(selection: $viewModel.tabIndex) {
                VStack {
                    ApplicationView(
                        items: viewModel.applicationItems,
                        selectedId: $viewModel.appId
                    )
                    Spacer()
                    Button {
                        Task {
                            await viewModel.sync()
                        }
                    } label: {
                        Text("connect")
                            .font(.system(size: 18).bold())
                            .foregroundColor(viewModel.buttonEnabled ? .white : AppColor.manatee)
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
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            NavigationLink(
                destination: UserMedicalView(
                    userMedical: viewModel.userMedical ?? UserMedical()
                ),
                isActive: $viewModel.gotoMedicalView
            ) {
                
            }
        }
        .task {
            await viewModel.checkHealthAvailability()
        }
    }
}

struct ConnectionManagementView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectionManagementView()
    }
}
