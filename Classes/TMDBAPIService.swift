import Foundation

public final class TMDBAPIService {
    private let apiKey: String
    private let baseURL = URL(string: "https://api.themoviedb.org/3/")!
    private let network = TMDBAPINetworkService()
    
    public init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    public func execute<T: TMDBAPIRequest>(request: T, completion: @escaping T.ResponseHandler) { 
        let url = self.url(from: request)
        
        network.sendRequest(url: url) { result in
            do {
                let data = try result.get()
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let response = try data.flatMap {
                    try decoder.decode(T.Response.self, from: $0)
                }
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    private func url<T: TMDBAPIRequest>(from request: T) -> URL {
        let url = URL(string: request.path, relativeTo: baseURL)!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let headers = request.headers(apiKey: apiKey)
        components.queryItems = headers.map { URLQueryItem(name: $0, value: $1) }
        return components.url!
    }
}
