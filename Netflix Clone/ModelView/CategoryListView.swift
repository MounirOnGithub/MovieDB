//
//  CategoryListView.swift
//  Netflix Clone
//
//  Created by Mounir Khanouri on 02/09/2023.
//

import SwiftUI

struct CategoryListView: View {
    
    @State private var movies: [Movie] = []
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(movies) { movie in
                        NavigationLink {
                            MovieDetailView(movie: movie)
                                .toolbarBackground(.visible, for: .navigationBar)
                                .navigationBarBackButtonHidden()
                        } label: {
                            MovieCell(movie: movie)
                        }
                    }
                }
            }
            .onAppear {
                Task {
                    let fetcher = MovieDBFetcher()
                    self.movies = await fetcher.getPopularMovies()
                }
            }
            .navigationTitle("Nom de la catégorie")
            .background(Color.appBackground)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CategoryListView()
        }
        
    }
}
