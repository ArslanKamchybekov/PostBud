//
//  UploadView.swift
//  PostBud
//
//  Created by Arslan Kamchybekov on 9/21/24.
//

import SwiftUI

struct UploadView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = UploadViewModel()
    @State private var caption = ""
    private var user: User? {
        return UserService.shared.currentUser
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack(alignment: .top){
                    ProfileImageView(user: user)
                    VStack(alignment: .leading, spacing: 8) {
                        Text(user?.username ?? "").fontWeight(.semibold)
                        TextField("Start a thread... ", text: $caption, axis: .vertical)
                    }
                    .font(.footnote)
                    if !caption.isEmpty {
                        Button{
                            caption = ""
                        } label: {
                            Image(systemName: "xmark")
                        }
                    }
                }
                Spacer()
            }
            .padding()
            .navigationTitle("New Post")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel"){
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Post"){
                        Task {
                            try await viewModel.uploadThread(caption: caption)
                            dismiss()
                        }
                    }
                    .opacity(caption.isEmpty ? 0.5 : 1.0)
                    .disabled(caption.isEmpty)
                    .fontWeight(.semibold)
                }
            }
            .foregroundColor(.black)
        }
    }
}

#Preview {
    UploadView()
}
