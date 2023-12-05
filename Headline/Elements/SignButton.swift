//
//  SignButton.swift
//  Headline
//
//  Created by Pavel Semenchenko on 05.12.2023.
//

import SwiftUI
fileprivate struct SignButtonStyle: ButtonStyle {
    let color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 120, height: 36)
            .background(color)
            .foregroundColor(.white)
            .clipShape(Capsule())
            
    }
}

struct SignButton: View {
    let text: String
    let enabled: Bool
    let busy: Bool
    let action: () -> Void
    
    private var color: Color {
        var color: Color = enabled ? .blue : .red
        if busy {
            color = .orange
        }
        return color
    }
    var body: some View {
        Button(text, action: action)
            .buttonStyle(SignButtonStyle(color: color))
            .disabled(!enabled || busy)
    }
}

#Preview {
    SignButton(text: "Sign in", enabled: true, busy: false, action: {} )
}
