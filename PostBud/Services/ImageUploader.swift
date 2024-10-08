//
//  ImageUploader.swift
//  PostBud
//
//  Created by Arslan Kamchybekov on 9/22/24.
//

import Firebase
import FirebaseStorage
 
struct ImageUploader {
    
    static func uploadImage(_ image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.25) else { return nil }
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference(withPath: "/profileImages/\(filename)")
        
        do {
            let _ = try await storageRef.putDataAsync(imageData)
            let url = try await storageRef.downloadURL()
            return url.absoluteString
        } catch {
            print("ERROR: \(error.localizedDescription)")
            return nil
        }
    }
}
