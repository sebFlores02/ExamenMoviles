//
//  getMovieInfo.swift
//  ExamenMoviles
//
//  Created by Sebastian Flores on 10/10/23.
//

import Foundation

protocol MovieInfoRequirementProtocol {
    func getMovieInfo(path: String) async -> Movie?
}

class MovieInfoRequirement: MovieInfoRequirementProtocol {
    static let shared = MovieInfoRequirement()

    let dataRepository: MovieRepository
    
    init(dataRepository: MovieRepository = MovieRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func getMovieInfo(path: String) async -> Movie? {
        return await dataRepository.getMovieInfo(path: path)
    }
}
