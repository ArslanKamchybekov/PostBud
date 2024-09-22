//
//  LoginView.swift
//  PostBud
//
//  Created by Arslan Kamchybekov on 9/21/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = "";
    @State private var password = "";
    var body: some View {
        NavigationStack{
            Spacer()
            VStack{
                TextField("Enter your email", text: $email)
                    .autocapitalization(.none)
                    .modifier(TextFieldModifier())
                SecureField("Enter your password", text: $password)
                    .modifier(TextFieldModifier())
            }
            NavigationLink{
                Text("Forgot password")
            } label: {
                Text("Forgot Password?")
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding()
            }
            Button{
                
            } label: {
                Text("Login")
                    .foregroundColor(.white)
                    .frame(width: 350, height: 40)
                    .background(.black)
                    .cornerRadius(4)
            }
            Spacer()
            Divider()
            NavigationLink {
                RegistrationView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                HStack{
                    Text("Don't have an account?")
                    Text("Sign Up")
                        .fontWeight(.bold)
                }
                .padding(.vertical)
                .foregroundColor(.black)
            }

        }
    }
}
 
#Preview {
    LoginView()
}
