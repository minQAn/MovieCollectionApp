//
//  Movie.swift
//  MovieCollection
//
//  Created by Min Ku An on 2022-10-24.
//

import Foundation

struct Movie: Codable, Identifiable {
    let posterPath: String?
    let isAdult: Bool // changed
    let overview: String
    let releaseDate: String
    let genreIds: [Int]
    let id: Int
    let originalTitle: String
    let originalLanguage: String
    let title: String
    let backdropPath: String?
    let popularity: Double
    let voteCount: Int
    let hasVideo: Bool
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case isAdult = "adult" //
        case overview
        case releaseDate = "release_date"
        case genreIds = "genre_ids"
        case id
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case title
        case backdropPath = "backdrop_path"
        case popularity
        case voteCount = "vote_count"
        case hasVideo = "video"
        case voteAverage = "vote_average"
    }
}


// for getAdult function, and MockData
extension Movie {
    
    var ageRatingText: String {
        isAdult ? "R-rated" : "All ages availabel"
    }
    
    var posterImageURL: URL? {
        guard let posterPath = posterPath else {
            return nil
        }
        return URL(string: "\(Host.IMAGE_BASE_URL)/\(posterPath)")
    }
    
    func isSaved(savedList: [Movie]) -> Bool {
        // TODO: check if savedList contains this movie
        return false
    }
    
    static let mockData: Movie =
    Movie(
        posterPath: "/tVxDe01Zy3kZqaZRNiXFGDICdZk.jpg",
        isAdult: false, overview: "overview",
        releaseDate: "2000-11-1",
        genreIds: [12,1],
        id: 12,
        originalTitle: "title",
        originalLanguage: "en",
        title: "title",
        backdropPath: "/path",
        popularity: 12.12,
        voteCount: 20,
        hasVideo: true,
        voteAverage: 13.23
    )
}
