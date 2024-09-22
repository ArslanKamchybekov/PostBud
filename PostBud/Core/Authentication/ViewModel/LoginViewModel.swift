//
//  RegistrationViewModel.swift
//  PostBud
//
//  Created by Arslan Kamchybekov on 9/21/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = "";
    @Published var password = "";

    
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
