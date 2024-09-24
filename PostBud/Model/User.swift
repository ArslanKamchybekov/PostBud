//
//  User.swift
//  PostBud
//
//  Created by Arslan Kamchybekov on 9/22/24.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    let fullname: String
    let username: String
    let email: String
    var profileImageUrl: String?
    var bio: String?
}
