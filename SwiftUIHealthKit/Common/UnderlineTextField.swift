//
//  UnderlineTextField.swift
//  SwiftUIHealthKit
//
//  Created by Quang Pham on 03/08/2022.
//

import SwiftUI

struct UnderlineTextFieldView: View {
    
    let title: String
    @Binding var text: String
    var rightText: String? = nil
        
    var body: some View {
        VStack {
            HStack {
                TextField(title, text: $text)
                if let rightText = rightText {
                    RightTextView(text: rightText)
                }
            }
            Rectangle()
                .frame(height: 1)
                .foregroundColor(text.isEmpty ? AppColor.mercucy : AppColor.dodgerBlue)
                .animation(.linear, value: text)
        }
    }
}

struct UnderlineDecimalFieldView: View {
    
    let title: String
    @Binding var value: Double?
    var rightText: String? = nil
    
    var body: some View {
        VStack {
            HStack {
                TextField(title, value: $value, format: .number)
                    .keyboardType(.decimalPad)
                if let rightText = rightText {
                    RightTextView(text: rightText)
                }
            }
            Rectangle()
                .frame(height: 1)
                .foregroundColor(value == nil ? AppColor.mercucy : AppColor.dodgerBlue)
                .animation(.linear, value: value)
        }
    }
}

struct UnderlineDateFieldView: View {
    
    let title: String
    @Binding var date: Date?
    var rightText: String? = nil
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter
    }()
    
    var body: some View {
        VStack {
            HStack {
                TextField(title, value: $date, formatter: dateFormatter)
                    .keyboardType(.decimalPad)
                if let rightText = rightText {
                    RightTextView(text: rightText)
                }
            }
            Rectangle()
                .frame(height: 1)
                .foregroundColor(date == nil ? AppColor.mercucy : AppColor.dodgerBlue)
                .animation(.linear, value: date)
        }
    }
}

struct RightTextView: View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .font(.system(size: 14))
            .foregroundColor(AppColor.tangerine)
    }
}
