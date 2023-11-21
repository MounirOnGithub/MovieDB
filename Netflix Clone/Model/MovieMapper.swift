//
//  MovieMapper.swift
//  Netflix Clone
//
//  Created by Mounir Khanouri on 16/11/2023.
//

import Foundation

struct MovieMapper {
    
    static func map(restMovie: RestMovie) -> Movie {
        return Movie(
            id: restMovie.id,
            title: restMovie.title,
            coverURL: URL(string: "https://image.tmdb.org/t/p/w500/\(restMovie.posterPath)")!,
            description: restMovie.overview,
            rate: restMovie.voteAverage,
            releaseDate: Date(from: restMovie.releaseDate, format: "yyyy-MM-dd")!
        )
    }
}
