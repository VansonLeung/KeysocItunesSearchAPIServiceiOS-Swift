import XCTest
@testable import KeysocItunesSearchAPIServiceiOS_Swift

final class KeysocItunesSearchAPIServiceiOS_SwiftTests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Initialize instance here
    }

    
    override func tearDown() {
        // Clean up after each test, if needed
        super.tearDown()
    }
    
    
    func testSearchSongs() {
        let expectation = XCTestExpectation(description: "testSearchSongs")

        // Call the search items function with your test parameters
        KCITunesAPIQueryService.shared.searchSongs(withQuery: "Alex") { result in
            switch result {
            case .success(let items):
                // Assert that the items array is not empty (or add your own assertions)
                XCTAssertFalse(items.isEmpty, "No items found")
                XCTAssertTrue(items.count == 10, "items count != 10")
            case .failure(let error):
                XCTFail("Search query failed with error: \(error.localizedDescription)")
            }

            // Fulfill the expectation to signal the test completion
            expectation.fulfill()
        }

        // Wait for the expectation to be fulfilled (timeout set to 10 seconds)
        wait(for: [expectation], timeout: 10.0)
    }

    
    func testSearchArtists() {
        let expectation = XCTestExpectation(description: "testSearchArtists")

        // Call the search items function with your test parameters
        KCITunesAPIQueryService.shared.searchArtists(withQuery: "lee") { result in
            switch result {
            case .success(let items):
                // Assert that the items array is not empty (or add your own assertions)
                XCTAssertFalse(items.isEmpty, "no items found")
                XCTAssertTrue(items.count == 10, "items count != 10")
            case .failure(let error):
                XCTFail("Search query failed with error: \(error.localizedDescription)")
            }

            // Fulfill the expectation to signal the test completion
            expectation.fulfill()
        }

        // Wait for the expectation to be fulfilled (timeout set to 10 seconds)
        wait(for: [expectation], timeout: 10.0)
    }
    
    
    func testSearchAlbums() {
        let expectation = XCTestExpectation(description: "testSearchAlbums")

        // Call the search items function with your test parameters
        KCITunesAPIQueryService.shared.searchAlbums(withQuery: "britney") { result in
            switch result {
            case .success(let items):
                // Assert that the items array is not empty (or add your own assertions)
                XCTAssertFalse(items.isEmpty, "no items found")
                XCTAssertTrue(items.count == 10, "items count != 10")
            case .failure(let error):
                XCTFail("Search query failed with error: \(error.localizedDescription)")
            }

            // Fulfill the expectation to signal the test completion
            expectation.fulfill()
        }

        // Wait for the expectation to be fulfilled (timeout set to 10 seconds)
        wait(for: [expectation], timeout: 10.0)
    }
    
    
    
    func testParamCountry() {
        let expectation = XCTestExpectation(description: "testParamCountry")

        // Call country list
        XCTAssertTrue(KCItunesParamCountryManager.shared.CountryDictMappingByAbbr["US"]?.english == "USA", "US should be equal to USA!")
        XCTAssertTrue(KCItunesParamCountryManager.shared.CountryDictMappingByAbbr["CN"]?.english == "China", "CN should be equal to China!")
        XCTAssertTrue(KCItunesParamCountryManager.shared.CountryDictMappingByAbbr["HK"]?.english == "Hong Kong SAR China", "HK should be equal to Hong Kong SAR China!")
        expectation.fulfill()

        // Wait for the expectation to be fulfilled (timeout set to 10 seconds)
        wait(for: [expectation], timeout: 10.0)
    }
    
    
    func testParamMediaType() {
        let expectation = XCTestExpectation(description: "testParamMediaType")

        // Call MediaType list
        XCTAssertTrue(KCItunesParamMediaTypeManager.shared.MediaTypeDictMappingByVal["musicVideo"]?.val == "musicVideo", "musicVideo not found!")
        expectation.fulfill()

        // Wait for the expectation to be fulfilled (timeout set to 10 seconds)
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testParamLang() {
        let expectation = XCTestExpectation(description: "testParamLang")

        // Call Lang list
        XCTAssertTrue(KCItunesParamLangManager.shared.LangDictMappingByVal["zh_hk"]?.val == "zh_hk", "zh_hk not found!")
        expectation.fulfill()

        // Wait for the expectation to be fulfilled (timeout set to 10 seconds)
        wait(for: [expectation], timeout: 10.0)
    }
}
