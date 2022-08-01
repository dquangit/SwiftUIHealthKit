//
//  CustomTabbarView.swift
//  SwiftUIHealthKit
//
//  Created by Quang Pham on 01/08/2022.
//

import SwiftUI

struct CustomTabbarView: View {
    
    @Binding var index: Int
    let tabbarItems: [TabbarItem]
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(Array(tabbarItems.enumerated()), id: \.offset) { (offset, item) in
                VStack {
                    Button(item.title) {
                        index = offset
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .font(.system(size: 16).bold())
                    .foregroundColor(.white)
                    .frame(height: 44)
                    Rectangle()
                        .fill(Color.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: offset == index ? 4 : 0)
                        .animation(.linear, value: index)
                }
               
            }
        }
    }
}

struct TabbarItem {
    let title: String
}
