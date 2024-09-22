//
//  EditProfileView.swift
//  PostBud
//
//  Created by Arslan Kamchybekov on 9/21/24.
//

import SwiftUI

struct EditProfileView: View {
    @State private var bio = "";
    @State private var link = "";
    @State private var isPrivateProfile = false;
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.systemGroupedBackground).edgesIgnoringSafeArea([.bottom, .horizontal])
                VStack{
                    HStack{
                        VStack(alignment: .leading){
                            Text("Name").fontWeight(.semibold)
                            Text("Sample name")
                        }
                        .font(.footnote)
                        Spacer()
                        ProfileImageView()
                    }
                    Divider()
                    VStack(alignment: .leading){
                        Text("Bio").fontWeight(.semibold)
                        TextField("Enter your bio...", text: $bio, axis: .vertical)
                    }
                    
                    Divider()
                    VStack(alignment: .leading){
                        Text("Link").fontWeight(.semibold)
                        TextField("Add link...", text: $link, axis: .vertical)
                    }
                    
                    Divider()
                    
                    Toggle("Private profile", isOn: $isPrivateProfile)
                } 
                .font(.footnote)
                .padding()
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel"){
                        
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done"){
                        
                    }
                    .fontWeight(.semibold)
                }
            }
            .foregroundColor(.black)
        }
    }
}

#Preview {
    EditProfileView()
}
