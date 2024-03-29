//
//  HomeScreen.swift
//  Headline
//
//  Created by Pavel Semenchenko on 03.12.2023.
//

import SwiftUI

struct HomeScreen: View {
    //test binding
    @State var testDame: String = "testData"
    
    @State var value : Float = 0
    @State var isOn = false
    
    enum Language : String, CaseIterable { // 1
        case swift
        case kotlin
        case java
        case javascript
    }
    
    @State var selectedItem = Language.swift
    
    var body: some View {
        ProgressView("Processing", value: value, total: 100)
            .progressViewStyle(LinearProgressViewStyle())
            .tint(.orange)
            .foregroundColor(.gray)
            .padding()
            .onAppear {
                // 2
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                    self.value += 12
                }
            }
        HStack{
            Toggle(isOn: $isOn, label: {
                Label("Airplane Mode", systemImage: "airplane")
            })
            .toggleStyle(ButtonToggleStyle())
            .foregroundColor(.orange)
            
            Spacer()
            
            Toggle(isOn: $isOn, label: {
                Label("Airplane Mode", systemImage: "airplane")
            })
            .toggleStyle(ButtonToggleStyle())
            .foregroundColor(.orange)
            
        }.padding()
        
        Picker("Pick a language", selection: $selectedItem) { // 3
                    ForEach(Language.allCases, id: \.self) { item in // 4
                        Text(item.rawValue.capitalized) // 5
                    }
        }.pickerStyle(.wheel)
        
        ScrollView {
            Text("Hello, World!").padding(10)
            Text("our value: \(testDame)")
            
            LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 8) {
                ForEach(0..<20) { index in
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
            TextField("enter value", text: $testDame).padding(20)
        }
    }
}

#Preview {
    HomeScreen()
}
