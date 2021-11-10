//
//  TMDBClient.swift
//  TheMovieDbAPIClient
//
//  Created by Desimini, Wilson on 9/30/21.
//

import Foundation

public struct TMDBClient {
    private let apiKey: String
    private let baseURL = URL(string: "https://api.themoviedb.org/3/")!
    private let network = TMDBNetworkService()
    
    public init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    public func execute<T: TMDBRequest>(_ request: T, completion: @escaping T.Handler) {
        let request = self.urlRequest(from: request)
        network.sendRequest(request) { result in
            do {
                let data = try result.get()
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let response = try data.flatMap {
                    try decoder.decode(T.TMDBResponse.self, from: $0)
                }
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    public func execute(
        _ imageRequest: TMDBAPI.Image.Request,
        completion: @escaping TMDBAPI.Image.Response.Handler
    ) {
        let url = imageRequest.url
        let request = URLRequest(url: url)
        network.sendRequest(request, completion: completion)
    }
    
    private func url<T: TMDBRequest>(from request: T) -> URL {
        let url = URL(string: request.path, relativeTo: baseURL)!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        var headers = request.parameters
        headers["api_key"] = apiKey
        components.queryItems = headers.map { URLQueryItem(name: $0, value: $1) }
        return components.url!
    }
    
    private func urlRequest<T: TMDBRequest>(from request: T) -> URLRequest {
        let url = self.url(from: request)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        return urlRequest
    }
}
