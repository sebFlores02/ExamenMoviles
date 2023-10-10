//
//  Repository.swift
//  ExamenMoviles
//
//  Created by Sebastian Flores on 10/10/23.
//

import Foundation

struct API {
    static let base = "https://image.tmdb.org/"
    static let baseList = "https://api.themoviedb.org/3/movie/popular"

    struct routes {
        static let img = "/t/p/original/"
    }
}

protocol MovieProtocol {
    func getMovieCollection() async -> MovieCollection?
    func getMovieInfo(path: String) async -> Movie?
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
    func getMovieInfo(path: String) async -> Movie? {
        let url = URL(string: "\(API.base)\(API.routes.img)/\(path)")!
        print(url)
        return await nservice.getMovieInfo(url: url)
    }
}
