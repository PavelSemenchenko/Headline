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
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationVM.currentRoute) {
                SplashScreen()
                //TabBar()
                    .navigationDestination(for: NavigationRoute.self) { route in
                        switch route {
                        case .home:
                            HomeScreen()
                        case .splash:
                            SplashScreen()
                        case .signIn:
                            SignInScreen()
                        case .signUp:
                            SignUpScreen()
                        case .profile:
                            ProfileScreen()
                        case .tabbar:
                            TabBar()
                        }
                    }
            }.environmentObject(navigationVM)
        }
    }
}
