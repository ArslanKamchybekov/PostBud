//
//  AuthService.swift
//  PostBud
//
//  Created by Arslan Kamchybekov on 9/21/24.
//

import FirebaseAuth

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init(){
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: withEmail, password: password)
            self.userSession = result.user
            print("LOGDED IN: \(result.user.uid)")
        } catch {
            print("ERROR: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail: String, password: String, fullname: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: withEmail, password: password)
            self.userSession = result.user
            print("SIGNED UP: \(result.user.uid)")
        } catch {
            print("ERROR: \(error.localizedDescription)")
        }
    }
    
    func signOut(){
        try? Auth.auth().signOut()
        self.userSession = nil
    }
}
