//
//  UserData.swift
//  Netflix Clone
//
//  Created by Mounir Khanouri on 21/11/2023.
//

import Foundation

class UserData: ObservableObject, Codable {
    var favouriteMovieIds: Set<Int>
    
    init(favouriteMovieIds: Set<Int>) {
        self.favouriteMovieIds = favouriteMovieIds
    }
}
