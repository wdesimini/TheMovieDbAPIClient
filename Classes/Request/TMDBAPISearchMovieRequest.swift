//
//  TMDBAPISearchMovieRequest.swift
//  TheMovieDbAPIClient
//
//  Created by Desimini, Wilson on 9/29/21.
//

import Foundation

public struct TMDBAPISearchMovieRequest: TMDBAPIRequest {
    public typealias Response = TMDBSearchMovieResponse
    public let page = "1"
    public let query: String
    
    public init(query: String) {
        self.query = query
    }
    
    public var path: String {
        "search/movie"
    }
    
    public func headers(apiKey: String) -> [String : String] {
        [
            "api_key": apiKey,
            "page": page,
            "query": query,
        ]
    }
}
