//
//  getMovieCollection.swift
//  ExamenMoviles
//
//  Created by Sebastian Flores on 10/10/23.
//

import Foundation

protocol MovieCollectionRequirementProtocol {
    func getMovieCollection() async -> MovieCollection?
}

class MovieCollectionRequirement: MovieCollectionRequirementProtocol {
    static let shared = MovieCollectionRequirement()

    let dataRepository: MovieRepository
    
    init(dataRepository: MovieRepository = MovieRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func getMovieCollection() async -> MovieCollection? {
        return await dataRepository.getMovieCollection()
    }
}
