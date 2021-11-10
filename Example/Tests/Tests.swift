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
