//
//  TMDBSearchMovieRequest.swift
//  TheMovieDbAPIClient
//
//  Created by Wilson Desimini on 9/29/21.
//

import Foundation

public struct TMDBSearchMovieAPIRequest: TMDBAPIRequest {
    public typealias Response = TMDBSearchMovieResponse
    public let page: String
    public let query: String
    
    public init(page: Int = 1, query: String) {
        self.page = String(page)
        self.query = query
    }
    
    public var path: String {
        "search/movie"
    }
    
    public var headers: [String : String] {
        [
            "page": page,
            "query": query,
        ]
    }
}
