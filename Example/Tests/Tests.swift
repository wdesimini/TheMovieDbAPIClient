import XCTest
import TheMovieDbAPIClient

class Tests: XCTestCase {
    private let client = TMDBClient(apiKey: "")
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testConfigurationAPIConfiguration() {
        let expectation = XCTestExpectation(description: "get API Configuration details")
        
        let request = TMDBAPI.Configuration.APIConfiguration.Request()
        
        client.execute(request) { result in
            let response = try? result.get()
            XCTAssertNotNil(response)
            dump(response)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testImageLogo() {
        // get config
        let configExpectation = XCTestExpectation(description: "fetch api configuration")
        let configRequest = TMDBAPI.Configuration.APIConfiguration.Request()
        var configResponse: TMDBAPI.Configuration.APIConfiguration.Response? = nil
        
        client.execute(configRequest) { result in
            configResponse = try? result.get()
            XCTAssertNotNil(configResponse)
            XCTAssertNotNil(configResponse?.images?.secureBaseUrl)
            XCTAssertTrue(!(configResponse?.images?.logoSizes?.isEmpty ?? true))
            configExpectation.fulfill()
        }
        
        // get logo path
        let watchProviderExpectation = XCTestExpectation(description: "fetch watch provider")
        let movieId = 500
        let movieWatchProvidersRequest = TMDBAPI.Movies.WatchProviders.Request(movieId: movieId)
        var movieWatchProvidersResponse: TMDBAPI.Movies.WatchProviders.Response? = nil
        
        client.execute(movieWatchProvidersRequest) { result in
            movieWatchProvidersResponse = try? result.get()
            XCTAssertNotNil(movieWatchProvidersResponse?.results?.us?.rent?.first?.logoPath)
            watchProviderExpectation.fulfill()
        }
        
        wait(for: [configExpectation, watchProviderExpectation], timeout: 5)
        
        // get logo image data
        let logoImageExpectation = XCTestExpectation(description: "fetch logo image data from url")
        let baseURL = URL(string: configResponse!.images!.secureBaseUrl!)!
        let filePath = movieWatchProvidersResponse!.results!.us!.rent!.first!.logoPath
        let size = configResponse!.images!.logoSizes!.last!
        let imageRequest = TMDBAPI.Image.Request(baseURL: baseURL, filePath: filePath, size: size)
        
        client.execute(imageRequest) { result in
            let imageData = try? result.get()
            XCTAssertNotNil(imageData)
            logoImageExpectation.fulfill()
        }
        
        wait(for: [logoImageExpectation], timeout: 5)
    }
    
    func testMoviesWatchProviders() {
        let expectation = XCTestExpectation(description: "find movie watch providers based on id")
        
        let movieId = 500
        let request = TMDBAPI.Movies.WatchProviders.Request(movieId: movieId)
        
        client.execute(request) { result in
            let response = try? result.get()
            XCTAssertNotNil(response)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testSearchMovies() {
        let expectation = XCTestExpectation(description: "find movies based on title")
        
        let title = "Ex Machina"
        let request = TMDBAPI.Search.Movies.Request(query: title)
        
        client.execute(request) { result in
            let response = try? result.get()
            XCTAssertNotNil(response)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
}

extension Encodable {
    fileprivate func prettyPrint() {
        let encoder = JSONEncoder()
        encoder.outputFormatting = {
            if #available(iOS 13.0, *) {
                return [.withoutEscapingSlashes, .prettyPrinted]
            } else {
                return [.prettyPrinted]
            }
        }()
        let data = try? encoder.encode(self)
        let jsonString = data.flatMap { String(data:$0, encoding: .utf8) }
        jsonString.flatMap { print($0) }
    }
}
