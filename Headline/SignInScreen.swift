//
//  SignInScreen.swift
//  Headline
//
//  Created by Pavel Semenchenko on 03.12.2023.
//

import SwiftUI

struct SignInScreen: View {
    @EnvironmentObject private var navigationVM: NavigationRouter
    @EnvironmentObject private var signVM: SignVM
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            Text("Sign in")
            EmailTextField(valid: signVM.isEmailCorrect, 
                           placeholder: "enter email",
                           text: $signVM.email)
            PasswordTextField(valid: signVM.isPasswordCorrect, 
                              placeholder: "enter password",
                              text: $signVM.password)
            
            SignButton(text: "Sign in", enabled: signVM.canLogin, busy: signVM.busy) {
                Task {
                    await signVM.signIn()
                    navigationVM.pushScreen(route: .tabbar)
                }
            }
            
        }
    }
}

#Preview {
    SignInScreen()
        .environmentObject(NavigationRouter())
        .environmentObject(SignVM())
}
