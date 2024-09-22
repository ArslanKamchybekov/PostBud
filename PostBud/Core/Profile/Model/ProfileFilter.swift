//
//  ProfileFilter.swift
//  PostBud
//
//  Created by Arslan Kamchybekov on 9/21/24.
//

import Foundation

enum ProfileFilter: Int, CaseIterable, Identifiable {
    case posts
    case replies
    
    var title: String {
        switch self {
        case .posts: return "Posts"
        case .replies: return "Replies"
        }
    }
    
    var id: Int { return self.rawValue }
}
