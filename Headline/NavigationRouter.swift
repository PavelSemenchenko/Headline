//
//  NavigationRouter.swift
//  Headline
//
//  Created by Pavel Semenchenko on 03.12.2023.
//

import SwiftUI

enum NavigationRoute: Hashable {
    //case splash
    case tabbar
    case signIn
    case signUp
    case home
    case profile
    case profileEdit
}

class NavigationRouter: ObservableObject {
    @Published var currentRoute: NavigationPath = NavigationPath()
    
    func pushScreen(route: NavigationRoute) {
        currentRoute.append(route)
    }
    
    func pushHome() {
        currentRoute.removeLast(currentRoute.count)
        pushScreen(route: .home)
    }
    
    func popScreen() {
        currentRoute.removeLast()
    }
    func pushUntilSignIn() {
        currentRoute.removeLast(currentRoute.count)
        pushScreen(route: .signIn)
    }
}

