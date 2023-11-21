//
//  Movie.swift
//  Netflix Clone
//
//  Created by Mounir Khanouri on 11/11/2023.
//

import Foundation

struct RestMovie: Decodable {
    let id: Int
    let overview: String
    let posterPath: String
    let releaseDate: String
    let title: String
    let voteAverage: Float
    
    enum CodingKeys: String, CodingKey {
        case id
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
    }
}

struct RestPopularMoviesResult: Decodable {
    let results: [RestMovie]
}
