//
//  ProfileEditScreen.swift
//  Headline
//
//  Created by Pavel Semenchenko on 15.12.2023.
//

import SwiftUI

struct ProfileEditScreen: View {
    @State private var name: String = ""
    @State private var nickName: String = ""
    @State private var about: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Change photo")
                
                NavigationView {
                    Form {
                        Section {
                            HStack {
                                Text("Name :            ")
                                TextField("", text: $name)
                                    .textContentType(.givenName)
                                    .overlay(RoundedRectangle(cornerRadius: 6)
                                        .stroke(Color.gray, lineWidth: 1))
                            }
                            HStack {
                                Text("Nick Name :   ")
                                TextField("", text: $nickName)
                                    .textContentType(.familyName)
                                    .overlay(RoundedRectangle(cornerRadius: 6)
                                        .stroke(Color.gray, lineWidth: 1))
                            }
                            HStack {
                                Text("About :")
                                TextEditor(text: $about)
                                    .frame(height: 100)
                                    .multilineTextAlignment(.leading)
                                    .lineSpacing(5)
                                    .padding()
                                    .overlay(RoundedRectangle(cornerRadius: 6)
                                        .stroke(Color.gray, lineWidth: 1))
                                    .padding(.leading, 50)
                            }
                        }
                    }.navigationBarTitle("Profile")
                }
                
                Button(action: {
                    // info that profile has been updated
                }, label: {
                    Text("Save profile")
                    
                })
            }//.background(Color.green.edgesIgnoringSafeArea(.all))
        }
    }
}

#Preview {
    ProfileEditScreen()
}
