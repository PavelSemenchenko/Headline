//
//  ProfileScreen.swift
//  Headline
//
//  Created by Pavel Semenchenko on 03.12.2023.
//

import SwiftUI

struct ProfileScreen: View {
    @EnvironmentObject private var navigationVM: NavigationRouter
    @EnvironmentObject private var signVM: SignVM
    @EnvironmentObject private var userRepository: UserRepository
    @State var name: String?
    @State var nickName: String?
    
    var body: some View {
        ScrollView{
            HStack {
                Text(userRepository.nickName)
                    .padding()
                Spacer()
                Button(action: {}, label: {
                    Text("add")
                }).padding()
                Button(action: {
                    Task {
                        signVM.logOut()
                        navigationVM.pushUntilSignIn()
                    }
                }, label: {
                    Text("log out")
                }).padding()
            }.onAppear {
                Task {
                    await userRepository.getUserInfo()
                }
            }
            Spacer()
            VStack {
                Text(userRepository.name)
                    .onAppear {
                        if userRepository.name == "..." {
                            Task {
                                await userRepository.getUserInfo()
                                print("Current User ID: \(userRepository.name)")
                            }
                        }
                    }.padding()
                Text("description")
            }
            Button(action: {}, label: {
                Text("info")
            })
            Spacer()
            HStack {
                Button(action: {}, label: {
                    Text("edit profile")
                })
                Button(action: {}, label: {
                    Text("share profile")
                })
            }
            Spacer(minLength: 100)
            HStack{
                VStack{
                    Image(systemName: "house")
                    Text("name")
                }
                VStack{
                    Image(systemName: "globe")
                    Text("name 2")
                }
            }
            LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 10) {
                ForEach(0..<40) { index in
                    VStack {
                        Image(systemName: "house")
                        Text("Item \(index)")
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                }
            }
            .padding()
            
        }
    }
}
/*
#Preview {
    ProfileScreen().environmentObject(UserRepository())
}*/
