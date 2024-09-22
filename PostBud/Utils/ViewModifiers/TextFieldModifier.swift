//
//  TextFieldModifier.swift
//  PostBud
//
//  Created by Arslan Kamchybekov on 9/21/24.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View{
        content
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(4)
            .padding(.horizontal)
    }
}
