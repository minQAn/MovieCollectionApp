//
//  NetworkManager.swift
//  MovieCollection
//
//  Created by Min Ku An on 2022-10-25.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    func fetchPopularMovies(completion: @escaping ([Movie]?) -> Void) {
        URLSession.shared.dataTask(with: Router.popular.url) { data, _, error in
            guard let data = data, error == nil else {
                print("URLSession went wrong!")
                completion(nil)
                return
            }

            let popularResponse = try? JSONDecoder().decode(PopularResponse.self, from: data)
            guard let movies = popularResponse?.results else {
                print("Decoding 'results' went wrong")
                completion(nil)
                return
            }

            completion(movies)
        }
        .resume()
    }
    
    // To catch an error of Decoding part
//    func fetchPopularMovies(completion: @escaping ([Movie]?) -> Void) {
//        URLSession.shared.dataTask(with: Router.popular.url) { data, _, error in
//            guard let data = data, error == nil else {
//                print("API call went wrong")
//                completion(nil)
//                return
//            }
//
//            var popularResponse: PopularResponse?
//            do {
//                popularResponse = try JSONDecoder().decode(PopularResponse.self, from: data)
//            } catch {
//                print("Decoding went wrong")
//                completion(nil)
//                return
//            }
////            let popularResponse = try? JSONDecoder().decode(PopularResponse.self, from: data)
//
//            guard let movies = popularResponse?.results else {
//                return
//            }
//
//            completion(movies)
//        }.resume()
//    }
    
}
