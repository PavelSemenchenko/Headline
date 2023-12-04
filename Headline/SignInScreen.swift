//
//  SignInScreen.swift
//  Headline
//
//  Created by Pavel Semenchenko on 03.12.2023.
//

import SwiftUI

struct SignInScreen: View {
    @EnvironmentObject private var navigarionVM: NavigationRouter
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            Text("Sign in")
            EmailTextField(valid: true, placeholder: "enter email", text: $email)
            PasswordTextField(valid: true, placeholder: "enter password", text: $password)
            Button(action: {}, label: {
                Text("Sign In")
            })
            
        }
    }
}

#Preview {
    SignInScreen()
}
