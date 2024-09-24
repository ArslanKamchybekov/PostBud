//
//  PreviewProvider.swift
//  PostBud
//
//  Created by Arslan Kamchybekov on 9/22/24.
//

import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    let user = User(id: NSUUID().uuidString, fullname: "Max Verstappen", username: "max_verstappen", email: "max@gmail.com")
    let thread = Thread(ownerId: "1", caption: "Test thread", timestamp: Timestamp(), likes: 0)
}
