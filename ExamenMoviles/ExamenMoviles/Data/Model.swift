//
//  Model.swift
//  ExamenMoviles
//
//  Created by Sebastian Flores on 10/10/23.
//

import Foundation

struct MovieCollection: Codable {
    var page: Int
    var results: [Movie]
}

struct Movie: Codable {
    var title: String
}

struct MovieBase: Identifiable {
    var id: Int
    var movie: Movie
//    var perfil: Perfil
}

//struct Perfil: Codable {
//    var sprites: Sprite
//}
//
//struct Sprite: Codable {
//    var poster_path: String
//}
