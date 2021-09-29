
// MARK:- Network

private struct TMDBAPINetworkService {
    typealias Handler = (Result<Data?, Error>) -> Void
    
    func sendRequest(url: URL, completion: @escaping Handler) {
        let session = URLSession.shared
        let request = URLRequest(url: url)
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

// MARK:- Request

public protocol TMDBAPIRequest {
    associatedtype Response: Decodable
    typealias ResponseHandler = (Result<Response?, Error>) -> Void
    var path: String { get }
    func headers(apiKey: String) -> [String: String]
}

public struct TMDBAPISearchMovieRequest: TMDBAPIRequest {
    public typealias Response = TMDBSearchMovieResponse
    public let page = "1"
    public let query: String
    
    public init(query: String) {
        self.query = query
    }
    
    public var path: String {
        "search/movie"
    }
    
    public func headers(apiKey: String) -> [String : String] {
        [
            "api_key": apiKey,
            "page": page,
            "query": query,
        ]
    }
}

// MARK:- Response

public struct TMDBSearchMovieResponse: Codable {
    public let page: Int
    public let results: [TMDBMovieSearchResult]
    public let totalPages: Int
    public let totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages
        case totalResults
    }

    public init(
        page: Int,
        results: [TMDBMovieSearchResult],
        totalPages: Int,
        totalResults: Int
    ) {
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
}

extension TMDBSearchMovieResponse {
    public struct TMDBMovieSearchResult: Codable {
        public let adult: Bool
        public let backdropPath: String?
        public let genreIds: [Int]
        public let id: Int
        public let overview: String
        public let originalTitle: String
        public let popularity: Double
        public let posterPath: String?
        public let releaseDate: String
        public let title: String
        public let voteAverage: Double
        public let video: Bool
        public let voteCount: Int
        
        enum CodingKeys: String, CodingKey {
            case adult
            case backdropPath
            case genreIds
            case id
            case overview
            case originalTitle
            case popularity
            case posterPath
            case releaseDate
            case title
            case voteAverage
            case video
            case voteCount
        }

        public init(
            adult: Bool,
            backdropPath: String?,
            genreIds: [Int],
            id: Int,
            overview: String,
            originalTitle: String,
            popularity: Double,
            posterPath: String?,
            releaseDate: String,
            title: String,
            voteAverage: Double,
            video: Bool,
            voteCount: Int
        ) {
            self.adult = adult
            self.backdropPath = backdropPath
            self.genreIds = genreIds
            self.id = id
            self.overview = overview
            self.originalTitle = originalTitle
            self.popularity = popularity
            self.posterPath = posterPath
            self.releaseDate = releaseDate
            self.title = title
            self.voteAverage = voteAverage
            self.video = video
            self.voteCount = voteCount
        }
    }
}

// MARK:- API

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
