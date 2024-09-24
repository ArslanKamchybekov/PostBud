//
//  FeedViewModel.swift
//  PostBud
//
//  Created by Arslan Kamchybekov on 9/23/24.
//

import Foundation

@MainActor
class FeedViewModel: ObservableObject {
    @Published var threads = [Thread]()
    
    init(){
        Task { try await fetchThreads() }
    }
    
    func fetchThreads() async throws {
        self.threads = try await ThreadService.fetchThreads()
        try await fetchThreadUsers()
    }
    
    private func fetchThreadUsers() async throws {
        for i in 0 ..< threads.count {
            let thread = threads[i]
            let ownerId = thread.ownerId
            let threadUser = try await UserService.fetchUser(withUid: ownerId)
            threads[i].user = threadUser
        }
    }
}
