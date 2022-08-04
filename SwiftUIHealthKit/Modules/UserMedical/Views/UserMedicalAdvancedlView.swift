//
//  UserMedicalAdvancedlView.swift
//  SwiftUIHealthKit
//
//  Created by Quang Pham on 04/08/2022.
//

import SwiftUI

struct UserMedicalAdvancedlView: View {
    
    @State var neckCircumference: Double?
    @State var waistCircumference: Double?
    @State var wristCircumference: Double?
    @State var hipCircumference: Double?
    @State var height: Double?
    @State var heartRate: Double?
    @State var cholestrol: Double?
    @State var glucoseLevel: Double?

    var body: some View {
        ScrollView {
            VStack(spacing: 28) {
                UnderlineDecimalFieldView(
                    title: "neck_circumference".localized,
                    value: $neckCircumference,
                    rightText: "in_cm".localized
                )
                UnderlineDecimalFieldView(
                    title: "waist_circumference".localized,
                    value: $waistCircumference,
                    rightText: "in_cm".localized
                )
                UnderlineDecimalFieldView(
                    title: "wrist_circumference".localized,
                    value: $wristCircumference,
                    rightText: "in_cm".localized
                )
                UnderlineDecimalFieldView(
                    title: "hip_circumference".localized,
                    value: $hipCircumference,
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
                    value: $cholestrol,
                    rightText: "nmol_per_l".localized
                )
                UnderlineDecimalFieldView(
                    title: "glucose_level_required".localized,
                    value: $glucoseLevel,
                    rightText: "nmol_per_l".localized
                )
            }.padding(.horizontal)
        }
    }
    
}
