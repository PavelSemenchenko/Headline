//
//  ContentView.swift
//  Headline
//
//  Created by Pavel Semenchenko on 03.12.2023.
//

import SwiftUI

enum TabBarId: Int, Hashable {
    case home = 0
    case profile = 1
    case signup = 2
    case signin = 3
}

struct TabBar: View {
    @EnvironmentObject private var navigationVM: NavigationRouter
    @State var currentTab = TabBarId.home
    
    var body: some View {
        TabView(selection: $currentTab){
            HomeScreen()
                .tabItem { Text("Home") }
                .tag(0)
            ProfileScreen()
                .tabItem { Text("Profile") }
                .tag(1)
            SignUpScreen()
                .tabItem { Text("Sign Up") }
                .tag(2)
            SignInScreen()
                .tabItem { Text("Sign In") }
                .tag(3)
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TabBar()
}
