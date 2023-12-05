//
//  EmailTextField.swift
//  Headline
//
//  Created by Pavel Semenchenko on 03.12.2023.
//

import SwiftUI

struct EmailTextField: View {
    var valid: Bool
    var placeholder: String
    var text: Binding<String>
    private var backgroundColor: Color {
        valid ? .white : .red
    }
    
    var body: some View {
        TextField(placeholder, text: text)
            .keyboardType(.emailAddress)
            .disableAutocorrection(true)
            .autocapitalization(.none)
        .border(backgroundColor)
        .cornerRadius(5)
        .textFieldStyle(.roundedBorder)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        .background(backgroundColor)
            .autocapitalization(.words)
            .padding(EdgeInsets(top: 8, leading: 36, bottom: 8, trailing: 36))
    }
}
/*
 #Preview {
 EmailTextField()
 }*/
