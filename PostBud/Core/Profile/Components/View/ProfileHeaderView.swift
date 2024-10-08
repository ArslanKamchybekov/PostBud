//
//  ProfileHeaderView.swift
//  PostBud
//
//  Created by Arslan Kamchybekov on 9/22/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    var user: User?
    
    init(user: User?){
        self.user = user
    }
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 12){
                VStack(alignment: .leading, spacing: 4){
                    Text(user?.fullname ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(user?.username ?? "")
                        .font(.subheadline)
                }
                if let bio = user?.bio {
                    Text(bio).font(.footnote)
                }
                
                Text("Follower count")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            ProfileImageView(user: user)
        }
        .padding()
    }
}

#Preview {
    ProfileHeaderView(user: User(id: NSUUID().uuidString, fullname: "Max Verstappen", username: "max_verstappen", email: "max@gmail.com"))
}
