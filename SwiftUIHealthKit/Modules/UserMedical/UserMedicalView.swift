//
//  UserMedicalView.swift
//  SwiftUIHealthKit
//
//  Created by Quang Pham on 01/08/2022.
//

import SwiftUI

struct UserMedicalView: View {
    
    let userMedical: UserMedical?
        
    @State var index = 0
    
    @State var name: String = ""
    @State var weight: Double?
    
    private let tabbarItems = [
        TabbarItem(title: "general_info".localized),
        TabbarItem(title: "advanced_info".localized)
    ]
    
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
                index: $index,
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
            TabView(selection: $index) {
                UserMedicalGeneralView(name: $name, weight: $weight).tag(0)
                UserMedicalAdvancedlView().tag(1)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            Button("save_changes") {

            }
            .font(.system(size: 18).weight(.medium))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 47)
            .background(AppColor.dodgerBlue)
            .cornerRadius(12)
            .padding()

            Button {

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

struct UserMedicalView_Previews: PreviewProvider {
    static var previews: some View {
        UserMedicalView(userMedical: UserMedical())
    }
}
