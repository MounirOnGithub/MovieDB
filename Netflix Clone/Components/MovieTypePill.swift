//
//  GenderPill.swift
//  Netflix Clone
//
//  Created by Mounir Khanouri on 16/11/2023.
//

import SwiftUI

struct MovieTypePill: View {
    let name: String
    
    var body: some View {
        Text(name)
            .padding(.horizontal, 12)
            .padding(.vertical, 4)
            .font(.system(size: 14, weight: .semibold))
            .foregroundColor(.secondaryText)
            .background {
                RoundedRectangle(cornerRadius: .infinity)
                    .foregroundColor(.white.opacity(0.1))
            }
    }
}

#Preview {
    MovieTypePill(name: "Test category")
}
