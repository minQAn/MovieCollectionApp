//
//  popularResponse.swift
//  MovieCollection
//
//  Created by Min Ku An on 2022-10-24.
//

import Foundation

struct PopularResponse: Codable {
    let page: Int
    let results: [Movie]
    let totalResults: Int
    let totalPages: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}
