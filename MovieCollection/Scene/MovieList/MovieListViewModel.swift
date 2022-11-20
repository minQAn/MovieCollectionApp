//
//  MovieListViewModel.swift
//  MovieCollection
//
//  Created by Min Ku An on 2022-10-25.
//

import Foundation

final class MovieListViewModel: ObservableObject {
    
    @Published var status: ViewType = .empty
    @Published var movies: [Movie] = []
    let myListViewModel: MyListViewModel = MyListViewModel() // is it okay to declare with let?
    
//    init() {
//        getPopularMovies()
//        filterAddedMovie(movies: movies)
//    }
//
//    func filterAddedMovie(movies: [Movie]) {
//        for movie in movies {
//            if myListViewModel.myMovieList.contains(where: { savedMovie in
//                movie.id == savedMovie.id
//            }) {
//                print(movie)
//            }
//        }
//    }
        
    func getPopularMovies() {
        // Removing all data and set status to loading before fetching
        movies.removeAll()
        status = .loading
        
        NetworkManager.shared.fetchPopularMovies { data in
            DispatchQueue.main.async {
                guard let fetchedMovies = data else {
                    self.status = .error
                    return
                }
                                
                // fetchedMovies = [] // to test in case of empty data
                if fetchedMovies.isEmpty {
                    self.status = .empty
                    return
                }
                
                self.status = .success
                self.movies = fetchedMovies
            }            
        }
    }
    
    // for retryFetchButton when the fetch's result is an error or empty
    func onTapFetch() {
        getPopularMovies()
    }
    
//    // Where should this savefunction  be located?
    func addMovieToMyList(movie: Movie) {
        myListViewModel.addMovie(movie: movie)
    }
}
