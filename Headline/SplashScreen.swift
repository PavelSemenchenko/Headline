//
//  SplashScreen.swift
//  Headline
//
//  Created by Pavel Semenchenko on 03.12.2023.
//

import SwiftUI

struct SplashScreen: View {
    @State private var logoOpacity: Double = 0.0
    @EnvironmentObject private var navigationVM: NavigationRouter
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .black], startPoint: .topTrailing, endPoint: .bottomLeading)
            /*
            Image("AppIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .opacity(logoOpacity)
                        */
            Text("Headline")
                .font(.largeTitle)
                //.font(.custom("NinaCTT", size: 24))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .opacity(logoOpacity)
                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //.background(Color.red)
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            withAnimation(.easeInOut(duration: 1.5)) {
                            logoOpacity = 1.0
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                //SignInVM.isAuthenticated ?
                navigationVM.pushScreen(route: .signIn)
                //: navigationVM.popUntilSignInScreen()
            }
        }
    }
}

#Preview {
    SplashScreen()
        .environmentObject(NavigationRouter())
}
