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
    
    var body: some View {
        ScrollView{
            HStack {
                Text("user nick name")
                Button(action: {}, label: {
                    Text("add smth")
                })
                Button(action: {}, label: {
                    Text("Setup smth")
                })
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
                    }
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
            /*
            Grid {
                
            }*/
            
        }
    }
}
/*
#Preview {
    ProfileScreen()
}*/
