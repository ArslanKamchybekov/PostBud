//
//  UserContentListView.swift
//  PostBud
//
//  Created by Arslan Kamchybekov on 9/22/24.
//

import SwiftUI

struct UserContentListView: View {
    @State private var selectedFilter: ProfileFilter = .posts
    @Namespace private var animation
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    
    var body: some View {
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
                    //ThreadCell()
                }
            }
        }
        .padding(.vertical)
    }
}

#Preview {
    UserContentListView()
}
