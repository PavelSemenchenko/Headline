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
                .font(.title)
                .fontWeight(.bold)
            EmailTextField(valid: signVM.isEmailCorrect, 
                           placeholder: "enter email",
                           text: $signVM.email)
            PasswordTextField(valid: signVM.isPasswordCorrect, 
                              placeholder: "enter password",
                              text: $signVM.password)
            HStack{
                SignButton(text: "Sign in", enabled: signVM.canLogin, busy: signVM.busy) {
                    Task {
                        await signVM.signIn()
                        navigationVM.pushScreen(route: .tabbar)
                    }
                }.padding(20)
                SignButton(text: "Sign up", enabled: signVM.canLogin, busy: signVM.busy) {
                    navigationVM.pushScreen(route: .signUp)
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(
            colors: [.blue, .yellow, .pink]),
            startPoint: .topTrailing, endPoint: .bottomLeading))
        .opacity(0.9)
    }
}

#Preview {
    SignInScreen()
        .environmentObject(NavigationRouter())
        .environmentObject(SignVM())
}
