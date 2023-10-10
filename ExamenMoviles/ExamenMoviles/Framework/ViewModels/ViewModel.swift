//
//  ViewModel.swift
//  ExamenMoviles
//
//  Created by Sebastian Flores on 10/10/23.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var movieCollection = [MovieBase]()
    
    var movieCollectionRequirement: MovieCollectionRequirement
    
    init(movieCollectionRequirement: MovieCollectionRequirement = MovieCollectionRequirement.shared) {
        self.movieCollectionRequirement = movieCollectionRequirement
    }
    
    func getList() async {
        let movieRepository = MovieRepository()
        let result = await movieRepository.getMovieCollection()
        
        for i in 0...result!.results.count-1 {

            let tempMovie = MovieBase(id: i, movie: result!.results[i])
            
            self.movieCollection.append(tempMovie)
            print(tempMovie)
            
        }
    }
}
    
    
    //        movieCollection.append(MovieBase(id: 1, movie: Movie(adult: true, backdropPath: "Test", genreIDS: [1], id: 1, originalTitle: "Oppenheimer", overview: "Test", popularity: 2.0, posterPath: "Test", releaseDate: "Test", title: "Oppenheimer", video: true, voteAverage: 2.0, voteCount: 2)))
    //        movieCollection.append(MovieBase(id: 1, movie: Movie(adult: true, backdropPath: "Test", genreIDS: [1], id: 1, originalTitle: "Oppenheimer", overview: "Test", popularity: 2.0, posterPath: "Test", releaseDate: "Test", title: "Oppenheimer", video: true, voteAverage: 2.0, voteCount: 2)))
    //        movieCollection.append(MovieBase(id: 1, movie: Movie(adult: true, backdropPath: "Test", genreIDS: [1], id: 1, originalTitle: "Oppenheimer", overview: "Test", popularity: 2.0, posterPath: "Test", releaseDate: "Test", title: "Oppenheimer", video: true, voteAverage: 2.0, voteCount: 2)))
    //        movieCollection.append(MovieBase(id: 1, movie: Movie(adult: true, backdropPath: "Test", genreIDS: [1], id: 1, originalTitle: "Oppenheimer", overview: "Test", popularity: 2.0, posterPath: "Test", releaseDate: "Test", title: "Oppenheimer", video: true, voteAverage: 2.0, voteCount: 2)))
    //        movieCollection.append(MovieBase(id: 1, movie: Movie(adult: true, backdropPath: "Test", genreIDS: [1], id: 1, originalTitle: "Oppenheimer", overview: "Test", popularity: 2.0, posterPath: "Test", releaseDate: "Test", title: "Oppenheimer", video: true, voteAverage: 2.0, voteCount: 2)))
    //        movieCollection.append(MovieBase(id: 1, movie: Movie(adult: true, backdropPath: "Test", genreIDS: [1], id: 1, originalTitle: "Oppenheimer", overview: "Test", popularity: 2.0, posterPath: "Test", releaseDate: "Test", title: "Oppenheimer", video: true, voteAverage: 2.0, voteCount: 2)))
    //        movieCollection.append(MovieBase(id: 1, movie: Movie(adult: true, backdropPath: "Test", genreIDS: [1], id: 1, originalTitle: "Oppenheimer", overview: "Test", popularity: 2.0, posterPath: "Test", releaseDate: "Test", title: "Oppenheimer", video: true, voteAverage: 2.0, voteCount: 2)))
    //        movieCollection.append(MovieBase(id: 1, movie: Movie(adult: true, backdropPath: "Test", genreIDS: [1], id: 1, originalTitle: "Oppenheimer", overview: "Test", popularity: 2.0, posterPath: "Test", releaseDate: "Test", title: "Oppenheimer", video: true, voteAverage: 2.0, voteCount: 2)))
    
    
//}
