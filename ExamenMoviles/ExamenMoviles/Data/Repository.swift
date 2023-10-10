//
//  Repository.swift
//  ExamenMoviles
//
//  Created by Sebastian Flores on 10/10/23.
//

import Foundation

/// API url = https://api.themoviedb.org/3/movie/popular
struct API {
    static let baseList = "https://api.themoviedb.org/3/movie/popular"
}

protocol MovieProtocol {
    func getMovieCollection() async -> MovieCollection?
}

class MovieRepository: MovieProtocol {
    // Create singleton to be used in Requirement

    static let shared = MovieRepository()

    let nservice: NetworkApiService

    init(nservice: NetworkApiService = NetworkApiService.shared) {
        self.nservice = nservice
    }

    /// @ brief Function that fetches collection of Movies
    /// return: collection of movies
    func getMovieCollection() async -> MovieCollection? {
        let url = URL(string: "\(API.baseList)")!
        print(url)
        return await nservice.getMovieCollection(url: url)
    }
}
