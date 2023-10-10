//
//  Repository.swift
//  ExamenMoviles
//
//  Created by Sebastian Flores on 10/10/23.
//

import Foundation

struct API {
    static let baseList = "https://api.themoviedb.org/3/movie/popular"
}

protocol MovieProtocol {
    func getMovieCollection() async -> MovieCollection?
}

class MovieRepository: MovieProtocol {
    static let shared = MovieRepository()

    let nservice: NetworkApiService

    init(nservice: NetworkApiService = NetworkApiService.shared) {
        self.nservice = nservice
    }

    func getMovieCollection() async -> MovieCollection? {
        let url = URL(string: "\(API.baseList)")!
        print(url)
        return await nservice.getMovieCollection(url: url)
    }
}
