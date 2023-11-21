//
//  Actor.swift
//  Netflix Clone
//
//  Created by Mounir Khanouri on 16/11/2023.
//

import Foundation

struct Actor: Identifiable {
    let id: Int
    let name: String
    let characterName: String
    let pictureURL: URL?
}

#if DEBUG

extension Actor {
    
    static let preview = Actor(
        id: 0,
        name: "Margot Robbie",
        characterName: "Barbie",
        pictureURL: URL(string: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/euDPyqLnuwaWMHajcU3oZ9uZezR.jpg")!
    )
}

#endif
