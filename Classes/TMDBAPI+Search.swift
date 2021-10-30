//
//  TMDBAPI+Search.swift
//  TheMovieDbAPIClient
//
//  Created by Desimini, Wilson on 9/30/21.
//

import Foundation

public extension TMDBAPI.Search {
    struct Movies {}
}

public extension TMDBAPI.Search.Movies {
    struct Request: TMDBRequest {
        public typealias TMDBResponse = Response
        public let page: String
        public let query: String
        public init(page: Int = 1, query: String) {
            self.page = String(page)
            self.query = query
        }
        public var method: String { "GET" }
        public var parameters: [String : String] {
            [
                "page": page,
                "query": query,
            ]
        }
        public var path: String { "search/movie" }
    }
    
    struct Response: Codable {
        public let page: Int
        public let results: [Self.Result]
        public let totalPages: Int
        public let totalResults: Int
        
        public struct Result: Codable {
            public let adult: Bool
            public let backdropPath: String?
            public let genreIds: [Int]
            public let id: Int
            public let overview: String
            public let originalLanguage: String?
            public let originalTitle: String
            public let popularity: Decimal
            public let posterPath: String?
            public let releaseDate: String
            public let title: String
            public let video: Bool
            public let voteAverage: Decimal
            public let voteCount: Int
        }
    }
}
