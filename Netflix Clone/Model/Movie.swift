//
//  Movie.swift
//  Netflix Clone
//
//  Created by Mounir Khanouri on 10/11/2023.
//

import Foundation

struct Movie: Identifiable {
    let id: Int
    let title: String
    let coverURL: URL
    let description: String
    let rate: Float
    let releaseDate: Date
}

#if DEBUG
extension Movie {
    
    static let previewMovie: Movie = Movie(
        id: 0,
        title: "Cars : Quatre roues",
        coverURL: URL(string: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/hvHw7ASXEK8x3EawlOtwYXrovdo.jpg")!,
        description: "Un champion de course, Flash McQueen vit à cent à l'heure jusqu’à ce qu’un détour le mène à Radiator Springs, une petite ville oubliée sur la Route 66. Il y rencontre Sally, Martin, Doc Hudson et un tas de personnages amusants qui l’aident à découvrir que la vie vaut plus que les trophées et la célébrité.",
        rate: 6.9,
        releaseDate: Date(from: "14/06/2006", format: "dd/MM/yyyy")!
    )
    
    
    static let popularMovies: [Movie] = [
            Movie(
                id: 1,
                title: "Transformers: Rise of the Beasts",
                coverURL: URL(string: "https://www.themoviedb.org/t/p/w1280/kq6AYN96FjWSZQVRYpAPmBAVq2s.jpg")!,
                description: "Les Decepticons viennent d'arriver sur Terre en 1994, tout comme Optimus Prime, qui existe depuis un peu plus longtemps. L'archéologue Elena et le soldat Noah au Pérou découvrent les traces d'un ancien conflit de transformateurs sur Terre. À l'époque, les Maximals, les Predacons et les Terrorcons s'affrontaient, et ils revinrent à la vie un peu plus tard.",
                rate: 7.3,
                releaseDate: Date(from: "07/06/2023", format: "dd/MM/yyyy")!
            ),
            Movie(
                id: 2,
                title: "Sound of Freedom",
                coverURL: URL(string: "https://www.themoviedb.org/t/p/w1280/mx4O9OEvIB265VM3UATLslsSW5t.jpg")!,
                description: "Après avoir sauvé un jeune garçon d'impitoyables trafiquants d'enfants, un agent fédéral apprend que la sœur du garçon est toujours captive et décide de la sauver aussi.",
                rate: 8.3,
                releaseDate: Date(from: "04/07/2023", format: "dd/MM/yyyy")!
            ),
            Movie(
                id: 3,
                title: "Barbie",
                coverURL: URL(string: "https://www.themoviedb.org/t/p/w1280/oQjqjIQ46VVa8Q80y3FfLrPXoK3.jpg")!,
                description: "Une barbie jugée pas assez \"parfaite\" part à l'aventure dans le monde réel.",
                rate: 8.4,
                releaseDate: Date(from: "19/07/2023", format: "dd/MM/yyyy")!
            )
        ]
}
#endif


