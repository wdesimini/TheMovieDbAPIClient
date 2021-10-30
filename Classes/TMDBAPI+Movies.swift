//
//  TMDBAPI+Movies.swift
//  TheMovieDbAPIClient
//
//  Created by Desimini, Wilson on 9/30/21.
//

import Foundation

public extension TMDBAPI.Movies {
    struct WatchProviders {}
}

public extension TMDBAPI.Movies.WatchProviders {
    struct Request: TMDBRequest {
        public typealias TMDBResponse = Response
        private let movieId: Int
        public init(movieId: Int) { self.movieId = movieId }
        public var method: TMDBHTTPMethod { .get }
        public var parameters: [String : String] { [:] }
        public var path: String { "movie/\(movieId)/watch/providers" }
    }
    
    struct Response: Decodable {
        public let id: Int
        public let results: ResultsByCountry?
        
        public struct ResultsByCountry: Decodable {
            public let us: ResultsByCountry.Result?
            
            enum CodingKeys: String, CodingKey {
                case us = "US"
            }
            
            public init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                us = try values.decodeIfPresent(ResultsByCountry.Result.self, forKey: .us)
            }
            
            public struct Result: Decodable {
                public let buy: [ProviderResult]?
                public let flatrate: [ProviderResult]?
                public let link: String
                public let rent: [ProviderResult]?
                
                public struct ProviderResult: Decodable {
                    public let displayPriority: Int
                    public let logoPath: String
                    public let providerId: Int
                    public let providerName: String
                }
            }
        }
    }
}
