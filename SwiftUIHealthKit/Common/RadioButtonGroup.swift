//
//  RadioButtonGroup.swift
//  SwiftUIHealthKit
//
//  Created by Quang Pham on 04/08/2022.
//

import SwiftUI

struct RadioButtonGroup<T: Hashable>: View {

    let title: String?
    let data: [RadioButtonItem<T>]
    @State private var fitHeight = CGFloat.zero

    @Binding var selected: T?

    var body: some View {
        HStack {
            if let title = title {
                Text(title)
                    .font(.system(size: 18).weight(.medium))
                    .foregroundColor(AppColor.manatee)
                    .frame(width: 150, alignment: .leading)
            }
            HStack {
                ForEach(data, id: \.value) { item in
                    RadioButton(
                        title: item.title,
                        selected: selected == item.value
                    )
                    .onTapGesture {
                        selected = item.value
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct RadioButton: View {
    
    let title: String
    let selected: Bool
    
    var body: some View {
        HStack {
            Image(selected ? ImageAssets.radioChecked.rawValue : ImageAssets.radio.rawValue)
            Text(title)
                .font(.system(size: 15))
                .multilineTextAlignment(.leading)
                .foregroundColor(selected ? AppColor.dodgerBlue : AppColor.manatee)
        }
    }
}

struct RadioButtonItem<T: Hashable> {
    let title: String
    let value: T
}
