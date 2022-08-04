//
//  UserMedicalAdvancedlView.swift
//  SwiftUIHealthKit
//
//  Created by Quang Pham on 04/08/2022.
//

import SwiftUI

struct UserMedicalAdvancedlView: View {
    
    @Binding var neck: Double?
    @Binding var waist: Double?
    @Binding var wrist: Double?
    @Binding var hip: Double?
    @Binding var height: Double?
    @Binding var heartRate: Double?
    @Binding var cholestrol: Double?
    @Binding var glucoseLevel: Double?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 28) {
                UnderlineDecimalFieldView(
                    title: "neck_circumference".localized,
                    value: $neck,
                    rightText: "in_cm".localized
                )
                UnderlineDecimalFieldView(
                    title: "waist_circumference".localized,
                    value: $waist,
                    rightText: "in_cm".localized
                )
                UnderlineDecimalFieldView(
                    title: "wrist_circumference".localized,
                    value: $wrist,
                    rightText: "in_cm".localized
                )
                UnderlineDecimalFieldView(
                    title: "hip_circumference".localized,
                    value: $hip,
                    rightText: "in_cm".localized
                )
                HStack {
                    Image(ImageAssets.info.rawValue)
                    Text("measurement_reference")
                        .font(.system(size: 14))
                        .foregroundColor(AppColor.dodgerBlue)
                    Spacer()
                }
                UnderlineDecimalFieldView(
                    title: "height".localized,
                    value: $height,
                    rightText: "in_cm".localized
                )
                UnderlineDecimalFieldView(
                    title: "heart_rate_required".localized,
                    value: $heartRate,
                    rightText: "bpm".localized
                )
                UnderlineDecimalFieldView(
                    title: "cholestrol_required".localized,
                    value:  $cholestrol,
                    rightText: "nmol_per_l".localized
                )
                UnderlineDecimalFieldView(
                    title: "glucose_level_required".localized,
                    value:  $glucoseLevel,
                    rightText: "nmol_per_l".localized
                )
            }.padding(.horizontal)
        }
    }
    
}
