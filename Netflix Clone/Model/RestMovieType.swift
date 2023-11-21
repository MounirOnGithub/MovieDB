//
//  RestMovieType.swift
//  Netflix Clone
//
//  Created by Mounir Khanouri on 16/11/2023.
//

import Foundation

struct RestMovieType: Decodable {
    let id: Int
    let name: String
}

struct RestMovieDetails: Decodable {
    let genres: [RestMovieType]
}
