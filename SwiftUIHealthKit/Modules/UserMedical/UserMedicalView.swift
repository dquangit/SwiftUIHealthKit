//
//  UserMedicalView.swift
//  SwiftUIHealthKit
//
//  Created by Quang Pham on 01/08/2022.
//

import SwiftUI

struct UserMedicalView: View {
        
    @StateObject private var viewModel: UserMedicalViewModel
    
    private let tabbarItems = [
        TabbarItem(title: "general_info".localized),
        TabbarItem(title: "advanced_info".localized)
    ]
    
    init(userMedical: UserMedical) {
        _viewModel = StateObject(
            wrappedValue: UserMedicalViewModel(userMedical: userMedical)
        )
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            CustomNavigationBar(title: "my_information".localized) {
                Button {
                   
                } label: {
                    Image(ImageAssets.profile.rawValue)
                }
                .frame(width: 32, height: 32)
                .buttonStyle(.plain)
            }
            CustomTabbarView(
                index: $viewModel.tabIndex,
                tabbarItems: tabbarItems
            )
            .background(AppColor.dodgerBlue)
            Text("enter_relevant_info")
                .font(.system(size: 18))
                .foregroundColor(AppColor.dodgerBlue)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(
                            AppColor.dodgerBlue,
                            lineWidth: 1
                        )
                )
                .padding()
            TabView(selection: $viewModel.tabIndex) {
                UserMedicalGeneralView(
                    name: $viewModel.name,
                    weight: $viewModel.weight,
                    gender: $viewModel.gender,
                    birthday: $viewModel.birthday,
                    weightUnit: $viewModel.weightUnit,
                    heartAttack: $viewModel.heartAttack,
                    stroke: $viewModel.stroke,
                    diabetes: $viewModel.diabetes,
                    mammaryGlandCancer: $viewModel.mammaryGlandCancer
                )
                .tag(0)
                UserMedicalAdvancedlView(
                    neck: $viewModel.neck,
                    waist: $viewModel.waist,
                    wrist: $viewModel.wrist,
                    hip: $viewModel.hip,
                    height: $viewModel.height,
                    heartRate: $viewModel.heartRate,
                    cholestrol: $viewModel.cholestrol,
                    glucoseLevel: $viewModel.glucoseLevel
                )
                .tag(1)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            Button("save_changes") {
                viewModel.save()
            }
            .font(.system(size: 18).weight(.medium))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 47)
            .background(AppColor.dodgerBlue)
            .cornerRadius(12)
            .padding()

            Button {
                hideKeyboard()
                viewModel.clearAll()
            } label: {
                Text("clear_all")
                    .font(.system(size: 18)
                        .weight(.medium))
                    .underline(true, color: AppColor.dodgerBlue)
                    .foregroundColor(AppColor.dodgerBlue)
            }
        }
    }
}
