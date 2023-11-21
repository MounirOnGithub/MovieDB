//
//  MovieDetailView.swift
//  Netflix Clone
//
//  Created by Mounir Khanouri on 16/11/2023.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    
    @State private var genres: [String] = []
    @State private var actors: [Actor] = []
    @State private var similarMovies: [Movie] = []
    
    @Environment(\.dismiss) var dismiss
        
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                coverImage
                VStack(alignment: .leading, spacing: 24) {
                    titleBox
                    movieTypeBox
                    descriptionBox
                    castBox
                    similarMoviesSection
                }
                .padding()
            }
        }
        .edgesIgnoringSafeArea(.top)
        .overlay(alignment: .topLeading) {
            CustomBackButton(icon: "chevron.left") {
                dismiss()
            }
            .padding(.top)
        }
        .overlay(alignment: .topTrailing) {
            CustomBackButton(icon: "heart", activeColor: .likeAccent, isActive: .constant(userData.favouriteMovieIds.contains(movie.id))) {
                if userData.favouriteMovieIds.contains(movie.id) {
                    userData.favouriteMovieIds.remove(movie.id)
                } else {
                    userData.favouriteMovieIds.insert(movie.id)
                }
                print(userData.favouriteMovieIds)
                userData.objectWillChange.send()
            }
            .padding(.top)
            .padding(.trailing, 20)
        }
        .onAppear {
            loadMovieTypes()
            loadActors()
            loadSimilarMovies()
        }
        .background(Color.appBackground)
    }
    
    func loadMovieTypes() {
        Task {
            let fetcher = MovieDBFetcher()
            let types = await fetcher.getMovieTypes(movieId: movie.id)
            self.genres = types
        }
    }
    
    func loadActors() {
        Task {
            let fetcher = MovieDBFetcher()
            let actors = await fetcher.getCast(movieId: movie.id)
            self.actors = actors
        }
    }
    
    func loadSimilarMovies() {
        Task {
            let fetcher = MovieDBFetcher()
            let similarMovies = await fetcher.getSimilarMovies(movieId: movie.id)
            self.similarMovies = similarMovies
        }
    }
    
    private var coverImage: some View {
        AsyncImage(url: movie.coverURL) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 400)
                .clipped()
                .overlay(alignment: .bottom) {
                    LinearGradient(colors: [.clear, .appBackground], startPoint: .top, endPoint: .bottom)
                }
        } placeholder: {
            Rectangle()
                .foregroundColor(.cellBackground)
        }
    }
    
    private var descriptionBox: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Description")
                .foregroundColor(.primaryText)
                .font(.system(size: 20, weight: .semibold))
            if (movie.description != "") {
                Text(movie.description)
                    .foregroundColor(.secondaryText)
                    .lineSpacing(4)
            }
        }
    }
    
    private var titleBox: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(movie.title)
                    .foregroundColor(.primaryText)
                    .font(.system(size: 28, weight: .bold))
                Text(movie.releaseDate.string(from: "dd/MM/yyyy") ?? "No date")
                    .foregroundColor(.secondaryText)
                    .font(.system(size: 16, weight: .light))
            }
            Spacer()
            RatingView(rating: movie.rate)
        }
    }
    
    private var movieTypeBox: some View {
        return HStack {
            ForEach(self.genres, id: \.self) { type in
                MovieTypePill(name: type)
            }
        }
    }
    
    private var castBox: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Acteurs")
                .foregroundColor(.primaryText)
                .font(.system(size: 20, weight: .semibold))
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top) {
                    ForEach(actors) { actor in
                        ActorCell(actor: actor)
                            .frame(width: 120)
                    }
                }
                .padding(20) // Remove space from the padding
            }
            .padding(-20)
        }
    }
    
    private var similarMoviesSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Similaires")
                .foregroundColor(.primaryText)
                .font(.system(size: 20, weight: .semibold))
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(similarMovies) { movie in
                        MovieShowcaseCell(coverURL: movie.coverURL)
                    }
                }
            }
        }
    }
}

#Preview {
    MovieDetailView(movie: .previewMovie)
}
