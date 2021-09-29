//
//  TMDBConfigurationResponse.swift
//  TheMovieDbAPIClient
//
//  Created by Wilson Desimini on 9/29/21.
//

import Foundation

public struct TMDBConfigurationResponse: Decodable {
    public let images: TMDBImagesConfiguration?
    public let changeKeys: [String]?

    enum CodingKeys: String, CodingKey {
        case images
        case changeKeys
    }
}

public struct TMDBImagesConfiguration: Decodable {
    public let backdropSizes: [String]?
    public let baseUrl: String?
    public let logoSizes: [String]?
    public let posterSizes: [String]?
    public let profileSizes: [String]?
    public let secureBaseUrl: String?
    public let stillSizes: [String]?

    enum CodingKeys: String, CodingKey {
        case baseUrl
        case secureBaseUrl
        case backdropSizes
        case logoSizes
        case posterSizes
        case profileSizes
        case stillSizes
    }
}
