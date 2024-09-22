//
//  UploadView.swift
//  PostBud
//
//  Created by Arslan Kamchybekov on 9/21/24.
//

import SwiftUI

struct UploadView: View {
    @State private var caption = "";
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            VStack{
                HStack(alignment: .top){
                    ProfileImageView()
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Sample name").fontWeight(.semibold)
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
