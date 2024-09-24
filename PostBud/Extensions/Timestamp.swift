//
//  Timestamp.swift
//  PostBud
//
//  Created by Arslan Kamchybekov on 9/23/24.
//

import Firebase

extension Timestamp {
    
    func timestampString() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: self.dateValue(), to: Date()) ?? ""
    }
}
