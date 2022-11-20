//
//  Router.swift
//  MovieCollection
//
//  Created by Min Ku An on 2022-10-24.
//

import Foundation

// examples..
// prod = Production, deployed API for users
// staging = for testing
// dev = for developers
enum Environment {
    case prod, staging
}

struct Host {
    static let VERSION = "3"
    
    static let prod = "https://api.themoviedb.org/\(VERSION)"
    static let staging = "https://staging.themoviedb.org/\(VERSION)" // just example
    
    static let APIKEY = "Enter your API Key here" // API Key
    static let IMAGE_BASE_URL = "https://image.tmdb.org/t/p/w500"
}

enum Router {
    case popular
    
    var path: String {
        switch self {
        case .popular:
            return "/movie/popular?api_key=\(Host.APIKEY)&language=en-US&page=1"
        }
    }
    
    var url: URL {
        return URL(string: Host.prod + path)!
    }
}
