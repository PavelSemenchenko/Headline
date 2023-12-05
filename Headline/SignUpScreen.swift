//
//  SignUpScreen.swift
//  Headline
//
//  Created by Pavel Semenchenko on 03.12.2023.
//

import SwiftUI

struct SignUpScreen: View {
    @EnvironmentObject private var navigationVM: NavigationRouter
    @EnvironmentObject private var signVM: SignVM
    @EnvironmentObject private var userRepository: UserRepository
    @State private var email = ""
    @State private var password = ""
    @State private var userName = ""
    
    var body: some View {
        VStack {
            Text("Sign up")
            UserNameTextField(valid: signVM.isUserNameCorrect,
                          placeholder: "enter name",
                              text: $signVM.userName)
            
            EmailTextField(valid: signVM.isEmailCorrect, 
                           placeholder: "enter Email",
                           text: $signVM.email)
            
            PasswordTextField(valid: signVM.isPasswordCorrect,
                              placeholder: "enter password",
                              text: $signVM.password)
            
            SignButton(text: "Sign Up", enabled: signVM.canLogin, busy: signVM.busy) {
                //guard !userName.isEmpty else { return }
                Task {
                    do {
                        var service = UserRepository()
                        service.navigationVM = navigationVM
                        await signVM.signUp()
                        await userRepository.addUserName(name: signVM.userName)
                        navigationVM.pushHome()
                        print("00000-00000")
                    } catch {
                        print("error with user creation")
                    }
                }
            }
        }
    }
}

#Preview {
    SignUpScreen()
        .environmentObject(SignVM())
}
