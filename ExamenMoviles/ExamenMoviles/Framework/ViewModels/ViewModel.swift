//
//  ViewModel.swift
//  ExamenMoviles
//
//  Created by Sebastian Flores on 10/10/23.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var movieCollection = [MovieBase]()
    @Published var isLoading = true
    @Published var error = false

    var movieCollectionRequirement: MovieCollectionRequirement
    
    init(movieCollectionRequirement: MovieCollectionRequirement = MovieCollectionRequirement.shared) {
        self.movieCollectionRequirement = movieCollectionRequirement
    }
    
    /// @brief Function that fetches collection of Movies
    @MainActor
    func getList() async {
        let result = await movieCollectionRequirement.getMovieCollection()
        guard result?.results != nil else {
           error = true
            return
        }
        
        for i in 0...result!.results.count-1 {
            
            let tempMovie = MovieBase(id: i, movie: result!.results[i])
            
            self.movieCollection.append(tempMovie)
        }
        
        isLoadingFunc()
    }

    /// @brief Function which turns isLoading off
    func isLoadingFunc(){
        isLoading = false
    }
}
