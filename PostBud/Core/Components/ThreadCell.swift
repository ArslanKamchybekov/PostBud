//
//  ThreadCell.swift
//  PostBud
//
//  Created by Arslan Kamchybekov on 9/21/24.
//

import SwiftUI

struct ThreadCell: View {
    var body: some View {
        VStack{
            HStack(alignment: .top, spacing: 12) {
                ProfileImageView()
                VStack(alignment: .leading, spacing: 4){
                    HStack {
                        Text("Sample")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Spacer()
                        Text("10m")
                            .font(.caption)
                            .foregroundColor(Color(.systemGray3))
                        Button {
                            
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(.black)
                        }
                    }
                    Text("Post")
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    HStack(spacing: 16){
                        Button {
                            
                        } label: {
                            Image(systemName: "heart")
                        }
                        Button {
                            
                        } label: {
                            Image(systemName: "bubble.right")
                        }
                        Button {
                            
                        } label: {
                            Image(systemName: "arrow.rectanglepath")
                        }
                        Button {
                            
                        } label: {
                            Image(systemName: "paperplane")
                        }
                    }
                    .foregroundColor(.black)
                    .padding(.vertical, 8)
                }
            }
            Divider()
        }
        .padding()
    }
}

#Preview {
    ThreadCell()
}
