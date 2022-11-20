//
//  AppState.swift
//  MovieCollection
//
//  Created by Min Ku An on 2022-10-27.
//

import Foundation

// To TEST fixing bugs.. 
final class AppState: ObservableObject {
    
    static let shared = AppState()
    
    @Published var myLlist: [Movie] = []
    
    init() {
       
    }
}
