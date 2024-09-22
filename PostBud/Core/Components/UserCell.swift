//
//  UserCell.swift
//  PostBud
//
//  Created by Arslan Kamchybekov on 9/21/24.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack{
            ProfileImageView()
            VStack(alignment: .leading){
                Text("User User")
                    .fontWeight(.semibold)
                Text("User")
            }
            .font(.footnote)
            
            Spacer()
            
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.horizontal)
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserCell()
}
