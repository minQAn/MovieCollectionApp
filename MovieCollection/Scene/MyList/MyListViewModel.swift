//
//  MyListViewModel.swift
//  MovieCollection
//
//  Created by Min Ku An on 2022-10-25.
//

import Foundation

final class MyListViewModel: ObservableObject {
    
    @Published var status: ViewType = .empty
    @Published var myMovieList: [Movie] = []
    
    private let localStorageManager = LocalStorageManager.shared
    
    func getMyMovieList() {
        self.status = .loading        
        
        localStorageManager.loadMyList { myList, response in
            print(response.description)
            
            switch response {
            case .success:
                self.myMovieList = myList
                self.status = .success
            case .emptyList:
                self.status = .empty
            default:
                self.status = .error
            }
        }                   
    }
        
    func onTapGetMyMovieList() {
        getMyMovieList()
    }
          
    func addMovie(movie: Movie) {
        // to NOT add the existed movie
        if myMovieList.contains(where: { item in
            movie.id == item.id
        }) {
            print("already saved")
            return
        }
        
        self.myMovieList.append(movie)
        saveMovies() // Operating automaticlly by didSet above But Not working for now..
    }
    
    // is it a bad way in swiftui?
    func removeMovie(id: Int) {
        if let index = myMovieList.firstIndex(where: { item in
            item.id == id
        }) {
            self.myMovieList.remove(at: index)  // Not working here... not saved..
        }
        
        saveMovies()
    }      
    
    func saveMovies() {
        localStorageManager.saveMyList(with: myMovieList)
    }
}
