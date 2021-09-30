import Foundation

public final class TMDBAPIService {
    private let apiKey: String
    private let baseURL = URL(string: "https://api.themoviedb.org/3/")!
    private var imagesConfiguration: TMDBImagesConfiguration!
    private let network = TMDBAPINetworkService()
    
    public init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    public func configure(completion: @escaping (Error?) -> Void) {
        let request = TMDBConfigurationRequest()
        
        execute(request: request) { result in
            do {
                let response = try result.get()
                self.imagesConfiguration = response?.images
                completion(nil)
            } catch {
                completion(error)
            }
        }
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
    
    public func image(path: String, completion: @escaping (Result<Data?, Error>) -> Void) {
        guard imagesConfiguration != nil else {
            completion(.success(nil))
            return
        }
        
        let url = self.imageURL(path: path)
        self.network.sendRequest(url: url, completion: completion)
    }
    
    private func imageURL(path: String) -> URL {
        let baseURLString = imagesConfiguration!.secureBaseUrl!
        let baseURL = URL(string: baseURLString)!
        let url = URL(string: path, relativeTo: baseURL)!
        let components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        return components.url!
    }
    
    private func url<T: TMDBAPIRequest>(from request: T) -> URL {
        let url = URL(string: request.path, relativeTo: baseURL)!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        var headers = request.headers
        headers["api_key"] = apiKey
        components.queryItems = headers.map { URLQueryItem(name: $0, value: $1) }
        return components.url!
    }
}
