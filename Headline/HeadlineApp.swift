//
//  HeadlineApp.swift
//  Headline
//
//  Created by Pavel Semenchenko on 03.12.2023.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct HeadlineApp: App {
        
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @ObservedObject var navigationVM = NavigationRouter()
    @ObservedObject var signVM = SignVM()
    @ObservedObject var userRepository = UserRepository()
    
    var body: some Scene {
        WindowGroup {
            if signVM.isAuthenticated {
                TabBar(currentTab: .home)
                    .environmentObject(userRepository)
            } else {
                NavigationStack(path: $navigationVM.currentRoute) {
                    SignInScreen()
                    //TabBar()
                        .navigationDestination(for: NavigationRoute.self) { route in
                            switch route {
                            case .home:
                                HomeScreen()
                            case .signIn:
                                SignInScreen().environmentObject(userRepository)
                            case .signUp:
                                SignUpScreen().environmentObject(userRepository)
                            case .profile:
                                ProfileScreen().environmentObject(userRepository)
                            case .tabbar:
                                TabBar()
                            }
                        }
                }.navigationBarBackButtonHidden(true)
            }
        }.environmentObject(navigationVM)
            .environmentObject(signVM)
            .environmentObject(userRepository)
        
    }
}
