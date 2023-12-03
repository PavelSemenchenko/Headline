//
//  ProfileScreen.swift
//  Headline
//
//  Created by Pavel Semenchenko on 03.12.2023.
//

import SwiftUI

struct ProfileScreen: View {
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
            VStack {
                Text("user name")
                Text("description")
            }
            Button(action: {}, label: {
                Text("info")
            })
            HStack {
                Button(action: {}, label: {
                    Text("edit profile")
                })
                Button(action: {}, label: {
                    Text("share profile")
                })
            }
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

#Preview {
    ProfileScreen()
}
