//
//  MovieShowcaseCell.swift
//  Netflix Clone
//
//  Created by Mounir Khanouri on 17/11/2023.
//

import SwiftUI

struct MovieShowcaseCell: View {
    let coverURL: URL
    
    var body: some View {
        AsyncImage(url: coverURL) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            Rectangle()
                .foregroundColor(.cellBackground)
        }
        .frame(width: 100, height: 150)
        .cornerRadius(10)
    }
}

#Preview {
    MovieShowcaseCell(coverURL: Movie.previewMovie.coverURL)
}
