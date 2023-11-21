//
//  MovieCell.swift
//  Netflix Clone
//
//  Created by Mounir Khanouri on 02/09/2023.
//

import SwiftUI

struct MovieCell: View {
    let movie: Movie
    
    var body: some View {
        HStack {
            cover
            details
        }
        .padding()
        .onAppear {
            Task {
                let fetcher = MovieDBFetcher()
                await fetcher.getPopularMovies()
            }
        }
    }
    
    // MARK: Private subviews
    private var cover: some View {
        AsyncImage(url: movie.coverURL) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            Rectangle()
                .foregroundColor(.white.opacity(0.2))
        }
        .frame(width: 100, height: 120)
        .clipped()
        .cornerRadius(10)
    }
    
    private var details: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 18))
                            .bold()
                            .foregroundColor(.primaryText)
                        Text(movie.releaseDate.string(from: "yyyy"))
                            .font(.system(size: 12))
                            .fontWeight(.light)
                            .foregroundColor(.secondaryText)
                    }
                    Spacer()
                    RatingView(rating: movie.rate)
                }
                
                Text(movie.description)
                    .multilineTextAlignment(.leading)
                    .lineLimit(4)
                    .font(.system(size: 14))
                    .fontWeight(.light)
                    .foregroundColor(.primaryText)
            }
            Spacer()
        }
    }
}

struct MovieCell_Previews: PreviewProvider {
    // toujours mettre @State pour les var binding pour la preview
    
    static var previews: some View {
        MovieCell(movie: .previewMovie)
            .background(Color.appBackground)
            .previewLayout(.sizeThatFits)
    }
}
