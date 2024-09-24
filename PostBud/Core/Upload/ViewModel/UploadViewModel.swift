//
//  UploadViewModel.swift
//  PostBud
//
//  Created by Arslan Kamchybekov on 9/23/24.
//

import FirebaseAuth
import Firebase

class UploadViewModel: ObservableObject {
    
    func uploadThread(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let thread = Thread(ownerId: uid, caption: caption, timestamp: Timestamp(), likes: 0)
        try await ThreadService.uploadThread(thread)
    }
}
