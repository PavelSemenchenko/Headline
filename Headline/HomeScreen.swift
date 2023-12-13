//
//  HomeScreen.swift
//  Headline
//
//  Created by Pavel Semenchenko on 03.12.2023.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        ScrollView {
            Text("Hello, World!").padding(10)
            
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

#Preview {
    HomeScreen()
}
