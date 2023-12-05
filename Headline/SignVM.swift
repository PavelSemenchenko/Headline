//
//  SignVM.swift
//  Headline
//
//  Created by Pavel Semenchenko on 05.12.2023.
//

import Foundation
import FirebaseAuth
import FirebaseAuthCombineSwift

class SignVM: ObservableObject {
    @Published var userName: String = ""
    @Published var email: String = "test@test.com"
    @Published var password: String = "123456"
    @Published var busy: Bool = false
    
    var isUserNameCorrect: Bool {
        get {
            userName.count >= 2
        }
    }
    
    var isEmailCorrect: Bool {
        email.contains("@")
    }
    var isPasswordCorrect: Bool {
        get {
            return password.count >= 6
        }
    }
    var canLogin: Bool {
        return isEmailCorrect && isPasswordCorrect 
        //&& isUserNameCorrect
    }
    //class 
    var isAuthenticated: Bool {
        print(Auth.auth().currentUser?.uid)
        return Auth.auth().currentUser != nil
    }
    @MainActor func logOut() {
        try? Auth.auth().signOut()
    }
    @MainActor func signIn() async {
        busy = true
        do {
            let result = try? await Auth.auth().signIn(withEmail: email, password: password)
        } catch {
            print(error)
        }
        busy = false
    }
    @MainActor func signUp() async {
        busy = true
        do {
            let result = try? await Auth.auth().createUser(withEmail: email, password: password)
        } catch {
            
        }
        busy = false
    }
    
}
