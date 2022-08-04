//
//  AvatarView.swift
//  SwiftUIHealthKit
//
//  Created by Quang Pham on 04/08/2022.
//

import SwiftUI

struct AvatarView: View {
    var body: some View {
        VStack {
            Image(ImageAssets.avatarPlaceholder.rawValue)
            HStack {
                Text("upload_photo")
                    .font(.system(size: 14))
                    .foregroundColor(AppColor.manatee)
                Spacer()
                Image(ImageAssets.upload.rawValue)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(AppColor.alabaster)
            .cornerRadius(4)
        }
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView()
    }
}
