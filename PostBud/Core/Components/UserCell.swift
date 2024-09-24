//
//  UserCell.swift
//  PostBud
//
//  Created by Arslan Kamchybekov on 9/21/24.
//

import SwiftUI

struct UserCell: View {
    let user: User
    var body: some View {
        HStack{
            ProfileImageView(user: user)
            VStack(alignment: .leading, spacing: 4){
                Text(user.username)
                    .fontWeight(.semibold)
                Text(user.fullname)
            }
            .font(.footnote)
            
            Spacer()
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserCell(user: User(id: NSUUID().uuidString, fullname: "Max Verstappen", username: "max_verstappen", email: "max@gmail.com"))
}
