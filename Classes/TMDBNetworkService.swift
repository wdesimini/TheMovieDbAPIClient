//
//  TMDBNetworkService.swift
//  TheMovieDbAPIClient
//
//  Created by Desimini, Wilson on 9/29/21.
//

import Foundation

struct TMDBNetworkService {
    typealias Handler = (Result<Data?, Error>) -> Void
    
    func sendRequest(_ request: URLRequest, completion: @escaping Handler) {
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(
                    error.flatMap { .failure($0) }
                        ?? .success(data)
                )
            }
        }
        task.resume()
    }
}
