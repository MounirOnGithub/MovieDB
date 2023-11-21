//
//  RestActor.swift
//  Netflix Clone
//
//  Created by Mounir Khanouri on 16/11/2023.
//

import Foundation

struct RestActor: Decodable {
    let id: Int
    let name: String
    let characterName: String
    let profilePath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case characterName = "character"
        case profilePath = "profile_path"
    }
}

struct RestCredits: Decodable {
    let cast: [RestActor]
}
