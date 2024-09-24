//
//  EditProfileView.swift
//  PostBud
//
//  Created by Arslan Kamchybekov on 9/21/24.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    let user: User
    
    @State private var bio = "";
    @State private var link = "";
    @State private var isPrivateProfile = false;
    @StateObject var viewModel = EditProfileViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.systemGroupedBackground).edgesIgnoringSafeArea([.bottom, .horizontal])
                VStack{
                    HStack{
                        VStack(alignment: .leading){
                            Text("Name").fontWeight(.semibold)
                            Text(user.fullname)
                        }
                        .font(.footnote)
                        Spacer()
                        PhotosPicker(selection: $viewModel.selectedItem) {
                            if let image = viewModel.profileImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            } else {
                                ProfileImageView(user: user)
                            }
                        }
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
                .background(.white)
                .cornerRadius(8)
                .padding()
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel"){
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done"){
                        Task {
                            try await viewModel.updateUserData()
                            dismiss()
                        }
                    }
                    .fontWeight(.semibold)
                }
            }
            .foregroundColor(.black)
        }
    }
}

#Preview {
    EditProfileView(user: User(id: NSUUID().uuidString, fullname: "Max Verstappen", username: "max_verstappen", email: "max@gmail.com"))
}
