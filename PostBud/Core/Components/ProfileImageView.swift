//
//  ProfileImageView.swift
//  PostBud
//
//  Created by Arslan Kamchybekov on 9/21/24.
//

import SwiftUI

struct ProfileImageView: View {
    var body: some View {
        Image(systemName: "house")
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
    }
}

#Preview {
    ProfileImageView()
}
