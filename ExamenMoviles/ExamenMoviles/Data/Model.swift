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
    var backdrop_path: String
    var original_language: String
    var overview: String
}

struct MovieBase: Identifiable {
    var id: Int
    var movie: Movie
}
