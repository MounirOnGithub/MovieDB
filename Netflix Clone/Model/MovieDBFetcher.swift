//
//  MovieDBFetcher.swift
//  Netflix Clone
//
//  Created by Mounir Khanouri on 10/11/2023.
//

import Foundation

class MovieDBFetcher {
    let stringURL = "https://api.themoviedb.org/3/movie/popular?api_key=2b53bd946b4c1eea908278341a1063a5"
    
    func getPopularMovies() async -> [Movie] {
        let url = URL(string: stringURL)!
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let json = try JSONDecoder().decode(RestPopularMoviesResult.self, from: data)
            
            let movies = json.results.map { restMovie in
                MovieMapper.map(restMovie: restMovie)
            }
            return movies
        } catch {
            print("🚨 \(error)")
            return []
        }
    }
    
    func getMovieTypes(movieId: Int) async -> [String] {
        let stringURL = "https://api.themoviedb.org/3/movie/\(movieId)?api_key=2b53bd946b4c1eea908278341a1063a5"
        let url = URL(string: stringURL)!
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let details = try JSONDecoder().decode(RestMovieDetails.self, from: data)
            
            let genres = details.genres.map { restGenre in
                return restGenre.name
            }
            
            return genres
            
        } catch {
            print("🚨 \(error)")
            return []
        }
    }
    
    func getCast(movieId: Int) async -> [Actor] {
        let stringURL = "https://api.themoviedb.org/3/movie/\(movieId)/credits?api_key=2b53bd946b4c1eea908278341a1063a5"
        let url = URL(string: stringURL)!
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let credits = try JSONDecoder().decode(RestCredits.self, from: data)
            
            // Transformation des acteurs
            return credits.cast.map { restActor in
                ActorMapper.map(restActor: restActor)
            }
        } catch {
            print("🚨 \(error)")
            return []
        }
    }
    
    func getSimilarMovies(movieId: Int) async -> [Movie] {
        let stringURL = "https://api.themoviedb.org/3/movie/\(movieId)/similar?api_key=2b53bd946b4c1eea908278341a1063a5"
            let url = URL(string: stringURL)!
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let result = try JSONDecoder().decode(RestPopularMoviesResult.self, from: data)
                
                let movies = result.results.map { restMovie in
                    MovieMapper.map(restMovie: restMovie)
                }
                
                return movies
            } catch {
                print("🚨 \(error)")
                return []
            }
    }
}
