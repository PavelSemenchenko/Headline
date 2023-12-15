//
//  ForgotPasswordScreen.swift
//  Headline
//
//  Created by Pavel Semenchenko on 15.12.2023.
//

import Foundation
import SwiftUI

struct ForgotPasswordScreen: View {
    @EnvironmentObject private var navigationVM: NavigationRouter
    @EnvironmentObject private var signVM: SignVM
    
    @State private var email: String = ""
    @State private var showError: Bool = false
    @State private var errorMessage: String?

    var body: some View {
        VStack {
            Spacer()

            Text("Forgot Password?")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            Text("Enter your email address to reset your password.")
                .foregroundColor(.gray)
                .padding()

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .autocapitalization(.none)
                .keyboardType(.emailAddress)

            if showError {
                Text(errorMessage ?? "")
                    .foregroundColor(.red)
                    .padding()
            }

            Button("Reset Password") {
                resetPassword()
                navigationVM.pushUntilSignIn()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)

            Spacer()
        }
        .padding()
    }

    private func resetPassword() {
        signVM.forgotPassword(email: email)
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordScreen()
    }
}
