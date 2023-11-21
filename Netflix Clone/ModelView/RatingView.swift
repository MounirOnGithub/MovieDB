//
//  RatingView.swift
//  Netflix Clone
//
//  Created by Mounir Khanouri on 16/11/2023.
//

import SwiftUI

struct RatingView: View {
    let rating: Float
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 5)
                .foregroundColor(.white.opacity(0.5))
            Circle()
                .trim(from: 0, to: CGFloat(rating) / 10.0)
                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round))
                .foregroundColor(.primaryAccent)
                .rotationEffect(.degrees(-90))
            
            Text(String(format: "%.1F", rating))
                .foregroundColor(.primaryText)
                .font(.system(size: 14))
        }
        .frame(width: 40, height: 40)
    }
}

#Preview {
    RatingView(rating: 7.5)
        .padding()
        .background(Color.appBackground)
        .previewLayout(.sizeThatFits)
}
