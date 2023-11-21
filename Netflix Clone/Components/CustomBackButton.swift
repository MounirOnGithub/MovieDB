//
//  CustomBackButton.swift
//  Netflix Clone
//
//  Created by Mounir Khanouri on 16/11/2023.
//

import SwiftUI

struct CustomBackButton: View {
    
    let icon: String
    let action: () -> Void
    @Binding var isActive: Bool
    let activeColor: Color
    
    init(icon: String, activeColor: Color, isActive: Binding<Bool>, action: @escaping () -> Void) {
        self.icon = icon
        self.action = action
        self.activeColor = activeColor
        self._isActive = isActive
    }
    
    init(icon: String, action: @escaping () -> Void) {
        self.icon = icon
        self.action = action
        self.activeColor = .white
        self._isActive = .constant(false)
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Circle()
                .foregroundColor(.white.opacity(0.5))
                .frame(width: 50, height: 50)
                .shadow(color: .black, radius: 10)
                .overlay {
                    Image(systemName: isActive ? icon + ".fill" : icon)
                        .imageScale(.large)
                        .bold()
                        .foregroundColor(isActive ? activeColor : .white)
                }
                .padding(.leading, 20)
        }
    }
}

#Preview {
    CustomBackButton(icon: "chevron.left", action: {})
}
