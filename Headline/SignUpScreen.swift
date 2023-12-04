//
//  SignUpScreen.swift
//  Headline
//
//  Created by Pavel Semenchenko on 03.12.2023.
//

import SwiftUI

struct SignUpScreen: View {
    @EnvironmentObject private var navigarionVM: NavigationRouter
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            Text("Sign up")
            EmailTextField(valid: true, placeholder: "enter Email", text: $email)
            PasswordTextField(valid: true, placeholder: "enter password", text: $password)
        }
    }
}

#Preview {
    SignUpScreen()
}
