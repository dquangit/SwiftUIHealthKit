//
//  CustomNavigationBar.swift
//  SwiftUIHealthKit
//
//  Created by Quang Pham on 04/08/2022.
//

import SwiftUI

struct CustomNavigationBar<Content: View>: View {
    
    let title: String
    let rightAction: () -> Content?
    var hideBackButton: Bool
    
    @Environment(\.dismiss) var dismiss
    
    init(
        title: String,
        hideBackButton: Bool = false,
        @ViewBuilder rightAction: @escaping (() -> Content?) = { nil }
    ) {
        self.title = title
        self.hideBackButton = hideBackButton
        self.rightAction = rightAction
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Button {
                dismiss()
            } label: {
                HStack {
                    Image(ImageAssets.back.rawValue)
                    Text("back")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                }
            }.buttonStyle(.plain)
                .opacity(hideBackButton ? 0 : 1)
                .disabled(hideBackButton)
            HStack {
                Text(title)
                    .font(.system(size: 24).bold())
                    .foregroundColor(.white)
                Spacer()
                rightAction()
            }
        }
        .ignoresSafeArea()
        .padding()
        .background(AppColor.dodgerBlue)
        .navigationBarHidden(true)
    }
}
