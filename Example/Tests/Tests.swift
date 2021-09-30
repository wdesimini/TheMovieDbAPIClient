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
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
