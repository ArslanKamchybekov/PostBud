//
//  RegistrationView.swift
//  PostBud
//
//  Created by Arslan Kamchybekov on 9/21/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = "";
    @State private var password = "";
    @State private var fullname = "";
    @State private var username = "";
    @Environment(\.dismiss) var dismiss;
    var body: some View {
        Spacer()
        VStack{
            TextField("Enter your full name", text: $fullname)
                .modifier(TextFieldModifier())
            TextField("Enter your username", text: $username)
                .modifier(TextFieldModifier())
            TextField("Enter your email", text: $email)
                .modifier(TextFieldModifier())
            SecureField("Enter your password", text: $password)
                .modifier(TextFieldModifier())
        }
        .padding(.vertical)
        Button{
            
        } label: {
            Text("Sign Up")
                .foregroundColor(.white)
                .frame(width: 350, height: 40)
                .background(.black)
                .cornerRadius(4)
        }
        Spacer()
        Divider()
        Button{
            dismiss()
        } label: {
            HStack{
                Text("Already have an account?")
                Text("Sign In")
                    .fontWeight(.bold)
            }
            .padding(.vertical)
            .foregroundColor(.black)
        }
    }
}

#Preview {
    RegistrationView()
}
