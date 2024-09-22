//
//  RegistrationView.swift
//  PostBud
//
//  Created by Arslan Kamchybekov on 9/21/24.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModel()
    @Environment(\.dismiss) var dismiss;
    var body: some View {
        Spacer()
        VStack{
            TextField("Enter your full name", text: $viewModel.fullname)
                .modifier(TextFieldModifier())
            TextField("Enter your username", text: $viewModel.username)
                .modifier(TextFieldModifier())
            TextField("Enter your email", text: $viewModel.email)
                .modifier(TextFieldModifier())
            SecureField("Enter your password", text: $viewModel.password)
                .modifier(TextFieldModifier())
        }
        .padding(.vertical)
        Button{
            Task{ try await viewModel.createUser() }
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
