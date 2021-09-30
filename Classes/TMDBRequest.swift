//
//  TMDBRequest.swift
//  TheMovieDbAPIClient
//
//  Created by Desimini, Wilson on 9/30/21.
//

import Foundation

public protocol TMDBRequest {
    associatedtype TMDBResponse: Decodable
    typealias Handler = (Result<TMDBResponse?, Error>) -> Void
    var method: String { get }
    var parameters: [String: String] { get }
    var path: String { get }
}
