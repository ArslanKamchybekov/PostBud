//
//  ExploreViewModel.swift
//  PostBud
//
//  Created by Arslan Kamchybekov on 9/22/24.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    
    init(){
        Task{ try await fetchUsers() }
    }
    
    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchUsers()
    }
}
