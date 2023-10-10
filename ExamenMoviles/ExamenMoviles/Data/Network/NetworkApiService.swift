//
//  APINetwork.swift
//  ExamenMoviles
//
//  Created by Sebastian Flores on 10/10/23.
//


import Foundation
import Alamofire

class NetworkApiService {
    static let shared = NetworkApiService()
    
    func getMovieCollection(url: URL) async -> MovieCollection? {
        let headers: HTTPHeaders = ["Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmZjhkZDc1NmUzMmI4YWNlZjYyZmQ2YzMwZmQwY2NmOSIsInN1YiI6IjY0ZWI5MzhiZTg5NGE2MDEzYmIxNjNjZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.6cGDTI8wql15qnVZErrd_6QRNaiRAi74pRD0LfOzVZM"]
//        print("\(headers)")
        
        let taskRequest = AF.request(url, method: .get, headers: headers).validate()
        
        let response = await taskRequest.serializingData().response
        
        switch response.result {
        case .success(let data):
            do {
                return try JSONDecoder().decode(MovieCollection.self, from: data)
            } catch {
                print(String(decoding: data, as: UTF8.self))
                print(error.localizedDescription)
                return nil
            }
        case let .failure(error):
            debugPrint(error.localizedDescription)
            return nil
        }
        
    }
    func getMovieInfo(url: URL) async -> Movie? {
        let headers: HTTPHeaders = ["Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmZjhkZDc1NmUzMmI4YWNlZjYyZmQ2YzMwZmQwY2NmOSIsInN1YiI6IjY0ZWI5MzhiZTg5NGE2MDEzYmIxNjNjZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.6cGDTI8wql15qnVZErrd_6QRNaiRAi74pRD0LfOzVZM"]
        print("\(url)")
        
        let taskRequest = AF.request(url, method: .get, headers: headers).validate()
        
        let response = await taskRequest.serializingData().response
        
        switch response.result {
        case .success(let data):
            do {
                return try JSONDecoder().decode(Movie.self, from: data)
            } catch {
                print(String(decoding: data, as: UTF8.self))
                print("quiero llorar 2")
                print(error.localizedDescription)
                return nil
            }
        case let .failure(error):
            debugPrint(error.localizedDescription)
            return nil
        }
        
    }
}
