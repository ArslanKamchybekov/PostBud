//
//  ProfileView.swift
//  PostBud
//
//  Created by Arslan Kamchybekov on 9/21/24.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    @State private var isFollowing = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                ProfileHeaderView(user: user)
                Button {
                    if isFollowing { isFollowing = false }
                    else { isFollowing = true }
                } label: {
                    if !isFollowing {
                        Text("Follow")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 350, height: 40)
                            .foregroundColor(.white)
                            .background(.black)
                            .cornerRadius(8)
                    } else {
                        Text("Following")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 350, height: 40)
                            .foregroundColor(.black)
                            .background(Color(.systemGray5))
                    }
                }
                UserContentListView(user: user)
            }
        }
    }
}

#Preview {
    ProfileView(user: User(id: NSUUID().uuidString, fullname: "Max Verstappen", username: "max_verstappen", email: "max@gmail.com"))
}
