//
//  ViewModel.swift
//  ExamenMoviles
//
//  Created by Sebastian Flores on 10/10/23.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var movieCollection = [MovieBase]()
    
    var movieCollectionRequirement: MovieInfoRequirement
    
    init(movieCollectionRequirement: MovieInfoRequirement = MovieInfoRequirement.shared) {
        self.movieCollectionRequirement = movieCollectionRequirement
    }
    
//    func getUnit() async {
//        let movieInfo = await movieCollectionRequirement.getMovieInfo(path: "/5gzzkR7y3hnY8AD1wXjCnVlHba5.jpg")
//        print(movieInfo)
//        
//    }
    
    func getList() async {
        let movieRepository = MovieRepository()
        let result = await movieRepository.getMovieCollection()
        
        for i in 1...result!.results.count-1 {
            let movieInfo = await movieRepository.getMovieInfo(path: )
            print(result)

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
