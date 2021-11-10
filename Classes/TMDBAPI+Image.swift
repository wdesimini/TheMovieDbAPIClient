//
//  TMDBAPI+Image.swift
//  TheMovieDbAPIClient
//
//  Created by Wilson Desimini on 11/10/21.
//

import Foundation

extension TMDBAPI.Image {
    public struct Request {
        public let baseURL: URL
        public let filePath: String
        public let size: String
        
        public init(baseURL: URL, filePath: String, size: String) {
            self.baseURL = baseURL
            self.filePath = filePath
            self.size = size
        }
        
        var url: URL {
            [size, filePath].reduce(baseURL) {
                $0.appendingPathComponent($1)
            }
        }
    }
    
    public typealias Response = Data
}

extension TMDBAPI.Image.Response {
    public typealias Handler = (Result<Self?, Error>) -> Void
}
