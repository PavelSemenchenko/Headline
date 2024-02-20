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
    
    //@Binding var childData: String

    @State private var isGetSomething = false
    @State private var animatingCircle = false
    @State private var animatingButton = false
    
    var body: some View {
        ScrollView {
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
                    Button(action: {
                        navigationVM.pushScreen(route: .profileEdit)
                    }, label: {
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
            HStack{
                List {
                    Section {
                        Text("1")
                    } header: {
                        Text(Date().formatted(date: .abbreviated, time: .omitted))
                    } footer: {
                        Text("To do List")
                    }
                }
            }
            
            HStack {
                Text("Get something").bold()
                    .opacity(isGetSomething ? 1.0 : 0.5)
                Spacer()
                Image(systemName: isGetSomething ? "checkmark.circle.fill" : "circle")
                    .font(.system(size: 24))
                    .scaleEffect(isGetSomething ? 1.25 : 1.0)
                    .foregroundColor(isGetSomething ? .green : .black)
                    .padding()
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 1.0)) {
                            isGetSomething.toggle()
                        }
                    }
            }.padding()
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
            //circle with spring
            Circle()
                .frame(width: 100,height: 100)
                .foregroundStyle(.linearGradient(colors: [.cyan,.green], startPoint: .topTrailing, endPoint: .bottomLeading))
                .offset(x: animatingCircle ? 30 : 0, y:animatingCircle ? -100 : 0 )
                .scaleEffect(animatingCircle ? 2.0 : 1.0)
                .onTapGesture {
                    withAnimation(.spring(response: 0.9, dampingFraction: 0.9, blendDuration: 0)) {
                        animatingCircle.toggle()
                    }
                }
            //button example
            Button(action: {
                withAnimation(.easeInOut(duration: 1).repeatCount(2)) {
                    animatingButton.toggle()
                }
            }, label: {
                Text("Animate")
                    .bold()
                    .frame(width: 200,height: 50)
                    .foregroundColor(.indigo)
                    .background(LinearGradient(colors: [.mint, .white], startPoint: .bottomLeading, endPoint: .topTrailing))
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .shadow(radius: 3)
                    .opacity(animatingButton ? 1.0 : 0.7)
                    .scaleEffect(animatingButton ? 1.5 : 1.0)
            })
            
            

        }//.edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ProfileScreen().environmentObject(UserRepository())
}

