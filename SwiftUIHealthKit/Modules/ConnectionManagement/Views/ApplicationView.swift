//
//  ApplicationView.swift
//  SwiftUIHealthKit
//
//  Created by Quang Pham on 01/08/2022.
//

import SwiftUI

struct ApplicationView: View {
    
    let items: [ApplicationViewItem]
    @Binding var selectedId: String?
    
    private let colums = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack {
            HStack {
                Text("choose_one_app")
                    .font(.system(size: 24).bold())
                Spacer()
                Button("info") {
                    
                }
            }.padding()
            LazyVGrid(columns: colums, spacing: 60) {
                ForEach(items, id: \.id) { item in
                    let selected = selectedId == item.id
                    Button {
                        selectedId = selected ? nil : item.id
                    } label: {
                        VStack(alignment: .center, spacing: 10) {
                            Image(item.asset)
                            Text(item.title)
                                .lineLimit(1)
                                .font(.system(size: 17).bold())
                        }
                        
                        
                    }
                    .disabled(!item.enabled)
                    .frame(
                        width: 145,
                        height: 155,
                        alignment: .center
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(
                                selected ? Color.blue : Color.gray,
                                lineWidth: selected ? 3 : 1
                            )
                    )
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct ApplicationViewItem {

    let id: String
    let asset: String
    let title: String
    let enabled: Bool

    init(id: String, asset: String, title: String, enabled: Bool = true) {
        self.id = id
        self.asset = asset
        self.title = title
        self.enabled = enabled
    }
}
