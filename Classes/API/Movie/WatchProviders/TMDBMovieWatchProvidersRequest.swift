//
//  TMDBMovieWatchProvidersRequest.swift
//  TheMovieDbAPIClient
//
//  Created by Wilson Desimini on 9/29/21.
//

import Foundation

public struct TMDBMovieWatchProvidersRequest: TMDBAPIRequest {
    public typealias Response = TMDBMovieWatchProvidersResponse
    private let movieId: Int
    
    public init(movieId: Int) {
        self.movieId = movieId
    }
    
    public var headers: [String : String] { [:] }
    
    public var path: String {
        "movie/\(movieId)/watch/providers"
    }
}
