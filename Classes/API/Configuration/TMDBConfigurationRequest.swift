//
//  TMDBConfigurationRequest.swift
//  TheMovieDbAPIClient
//
//  Created by Wilson Desimini on 9/29/21.
//

import Foundation

public struct TMDBConfigurationRequest: TMDBAPIRequest {
    public typealias Response = TMDBConfigurationResponse
    
    public init() {}
    
    public var headers: [String : String] {
        [:]
    }
    
    public var path: String {
        "configuration"
    }
}
