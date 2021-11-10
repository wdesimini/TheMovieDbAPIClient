//
//  TMDBAPI+Configuration.swift
//  TheMovieDbAPIClient
//
//  Created by Desimini, Wilson on 9/30/21.
//

import Foundation

public extension TMDBAPI.Configuration {
    struct APIConfiguration {}
}

public extension TMDBAPI.Configuration.APIConfiguration {
    struct Request: TMDBRequest {
        public typealias TMDBResponse = Response
        public init() {}
        public var method: TMDBHTTPMethod { .get }
        public var parameters: [String : String] { [:] }
        public var path: String { "configuration" }
    }
}

public extension TMDBAPI.Configuration.APIConfiguration {
    struct Response: Codable {
        public let images: Images?
        public let changeKeys: [String]?
        
        public struct Images: Codable {
            public let backdropSizes: [String]?
            public let baseUrl: String?
            public let logoSizes: [String]?
            public let posterSizes: [String]?
            public let profileSizes: [String]?
            public let secureBaseUrl: String?
            public let stillSizes: [String]?
        }
    }
}
