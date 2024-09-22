//
//  ProfileView.swift
//  PostBud
//
//  Created by Arslan Kamchybekov on 9/21/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter: ProfileFilter = .posts
    @Namespace private var animation
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 12){
                        VStack(alignment: .leading, spacing: 4){
                            Text("Full Name")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text("User Name")
                                .font(.subheadline)
                        }
                        Text("Description")
                            .font(.footnote)
                        Text("Follower count")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    ProfileImageView()
                }
                .padding(.horizontal)
                
                Button {
                    
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 350, height: 40)
                        .foregroundColor(.white)
                        .background(.black)
                        .cornerRadius(4)
                }
                VStack{
                    HStack{
                        ForEach(ProfileFilter.allCases){ filter in
                            VStack{
                                Text(filter.title)
                                    .font(.subheadline)
                                    .fontWeight(selectedFilter == filter ? .semibold : .regular)
                                
                                if selectedFilter == filter {
                                    Rectangle()
                                        .foregroundColor(.black)
                                        .frame(width: filterBarWidth, height: 1)
                                        .matchedGeometryEffect(id: "item", in: animation)
                                } else {
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: filterBarWidth, height: 1)
                                }
                            }
                            .onTapGesture {
                                withAnimation(.spring()){
                                    selectedFilter = filter
                                }
                            }
                        }
                    }
                    LazyVStack{
                        ForEach(0 ... 10, id: \.self){ thread in
                            ThreadCell()
                        }
                    }
                }
                .padding(.vertical)
            }
        }
    }
}

#Preview {
    ProfileView()
}
