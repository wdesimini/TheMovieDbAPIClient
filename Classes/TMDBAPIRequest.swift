//
//  TMDBAPIRequest.swift
//  TheMovieDbAPIClient
//
//  Created by Desimini, Wilson on 9/29/21.
//

import Foundation

public protocol TMDBAPIRequest {
    associatedtype Response: Decodable
    typealias ResponseHandler = (Result<Response?, Error>) -> Void
    var path: String { get }
    func headers(apiKey: String) -> [String: String]
}
