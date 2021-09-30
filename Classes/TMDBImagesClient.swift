//
//  TMDBImagesClient.swift
//  TheMovieDbAPIClient
//
//  Created by Wilson Desimini on 9/30/21.
//

import Foundation

// MARK:- API

public extension TMDBAPI {
    struct Images {
    }
}

// MARK: - Request/Response

public extension TMDBAPI.Images {
    struct Request {
        public typealias Handler = (Result<Response?, Error>) -> Void
        public let baseUrl: String
        public let filePath: String
        public let fileSize: String
        public init(baseUrl: String, filePath: String, fileSize: String) {
            self.baseUrl = baseUrl
            self.filePath = filePath
            self.fileSize = fileSize
        }
        var path: String { "\(baseUrl)/\(fileSize)/\(filePath)" }
    }
    
    typealias Response = Data
}

// MARK:- Client

public struct TMDBImagesClient {
    private let apiKey: String
    private let network = TMDBNetworkService()
    
    public init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    public func image(
        _ request: TMDBAPI.Images.Request,
        completion: @escaping TMDBAPI.Images.Request.Handler
    ) {
        let url = imageURL(request)
        network.sendRequest(url: url, completion: completion)
    }
    
    private func imageURL(_ request: TMDBAPI.Images.Request) -> URL {
        let url = URL(string: request.path)!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let headers = ["api_key": apiKey]
        components.queryItems = headers.map { URLQueryItem(name: $0, value: $1) }
        return components.url!
    }
}
