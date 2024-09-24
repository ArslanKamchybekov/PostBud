//
//  UserContentListView.swift
//  PostBud
//
//  Created by Arslan Kamchybekov on 9/22/24.
//

import SwiftUI

struct UserContentListView: View {
    @StateObject var viewModel: UserContentListViewModel
    @State private var selectedFilter: ProfileFilter = .posts
    @Namespace private var animation
    
    init(user: User){
        self._viewModel = StateObject(wrappedValue: UserContentListViewModel(user: user))
    }
    
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
                if viewModel.threads.count == 0 {
                    Text("No posts yet...")
                        .padding()
                        .foregroundColor(.gray)
                } else{
                    ForEach(viewModel.threads){ thread in
                        ThreadCell(thread: thread )
                    }
                }
            }
        }
        .padding(.vertical)
    }
}

#Preview {
    UserContentListView(user: User(id: NSUUID().uuidString, fullname: "Max Verstappen", username: "max_verstappen", email: "max@gmail.com"))
}
