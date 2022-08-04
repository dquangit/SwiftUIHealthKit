//
//  UserMedicalGeneralView.swift
//  SwiftUIHealthKit
//
//  Created by Quang Pham on 03/08/2022.
//

import SwiftUI

struct UserMedicalGeneralView: View {
    
    @Binding var name: String
    @Binding var weight: Double?
    @Binding var gender: Gender?
    @Binding var birthday: Date?
    @Binding var weightUnit: WeightUnit?
    @Binding var heartAttack: Bool?
    @Binding var stroke: Bool?
    @Binding var diabetes: Bool?
    @Binding var mammaryGlandCancer: Bool?
    
    private let genders = [
        RadioButtonItem(
            title: "male".localized,
            value: Gender.male
        ),
        RadioButtonItem(
            title: "female".localized,
            value: Gender.female
        )
    ]
    
    private let weightUnits = [
        RadioButtonItem(title: "kilograms".localized, value: WeightUnit.kilogram),
        RadioButtonItem(title: "pounds".localized, value: WeightUnit.pound)
    ]
    
    private let yesNoSelection = [
        RadioButtonItem(title: "yes".localized, value: true),
        RadioButtonItem(title: "no".localized, value: false)
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 28) {
                AvatarView()
                UnderlineTextFieldView(title: "name_required".localized, text: $name)
                UnderlineDateFieldView(
                    title: "date_of_birth_required".localized,
                    date: $birthday,
                    rightText: "DD-MM-YYYY"
                )
                RadioButtonGroup(
                    title: "gender".localized,
                    data: genders,
                    selected: $gender
                )
                HStack {
                    UnderlineDecimalFieldView(
                        title: "weight_required".localized,
                        value: $weight
                    ).frame(width: 150)
                    RadioButtonGroup(
                        title: nil,
                        data: weightUnits,
                        selected: $weightUnit
                    )
                }
                Text("sensitive_data_acccurate")
                    .font(.system(size: 14))
                    .foregroundColor(AppColor.sunglo)
                    .frame(maxWidth: .infinity, alignment: .leading)
                RadioButtonGroup(
                    title: "heart_attack_required".localized,
                    data: yesNoSelection,
                    selected: $heartAttack
                )
                RadioButtonGroup(
                    title: "stroke_required".localized,
                    data: yesNoSelection,
                    selected: $stroke
                )
                RadioButtonGroup(
                    title: "diabetes_required".localized,
                    data: yesNoSelection,
                    selected: $diabetes
                )
                VStack(alignment: .leading) {
                    RadioButtonGroup(
                        title: "mammary_gland_cancer".localized,
                        data: yesNoSelection,
                        selected: $mammaryGlandCancer
                    )
                    Text("female_only")
                        .font(.system(size: 12).weight(.medium))
                        .foregroundColor(AppColor.manatee)
                }
            }.padding()
        }
    }
}
