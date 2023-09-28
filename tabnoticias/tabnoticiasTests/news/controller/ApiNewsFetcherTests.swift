//
//  ApiNewsFetcherTests.swift
//  tabnoticiasTests
//
//  Created by Wilsley Germano on 18/09/23.
//

import Foundation
import XCTest
@testable import tabnoticias

final class ApiNewsFetcherTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    func testApiNewsFetcher()  {
        let expectation = XCTestExpectation(description: "Fetching news")
        
        let response = ApiNewsFetcher().call
        // Your assertions and tests go here
        XCTAssertNotNil(response)
        expectation.fulfill()
        
        
        wait(for: [expectation], timeout: 30.0) // Adjust the timeout as needed
    }
    
    func testNewsModelMapper() {
        var results: [NewsModel]?
        let json = """
                [
                {
                        "id": "a718071a-29e5-494e-bcf5-0ec5635c55b7",
                        "owner_id": "37f7d8c0-e525-467b-8f12-995e7a381d3e",
                        "parent_id": null,
                        "slug": "formas-de-ganhar-com-desenvolvimento-de-software",
                        "title": "Formas de ganhar $ com desenvolvimento de software",
                        "status": "published",
                        "source_url": null,
                        "created_at": "2023-09-20T11:42:54.617Z",
                        "updated_at": "2023-09-20T12:42:51.715Z",
                        "published_at": "2023-09-20T11:42:54.657Z",
                        "deleted_at": null,
                        "tabcoins": 26,
                        "owner_username": "caiquearaujo",
                        "children_deep_count": 6
                    },
                    {
                        "id": "0c85ebac-c1df-4d0f-81fb-5063e88e81d8",
                        "owner_id": "5c33067d-c676-4d00-9d3e-6ba8f9ac852b",
                        "parent_id": null,
                        "slug": "removendo-acentos-nao-so-em-javascript-ou-unicode-e-suas-bizarrices",
                        "title": "Removendo acentos (não só) em JavaScript (ou: Unicode e suas bizarrices)",
                        "status": "published",
                        "source_url": null,
                        "created_at": "2023-09-19T13:43:07.245Z",
                        "updated_at": "2023-09-20T13:45:38.463Z",
                        "published_at": "2023-09-19T13:43:07.271Z",
                        "deleted_at": null,
                        "tabcoins": 20,
                        "owner_username": "kht",
                        "children_deep_count": 1
                    }]
                """
        
        do {
            let data = Data(json.utf8)
            let decodedResponse = try JSONDecoder().decode([NewsModel].self, from: data)
            results = decodedResponse
            
        } catch {
            debugPrint("[API NEWS FETCHER ERROR] - Error Trying to Call For News: \(error)")
            
        }
        
        XCTAssertNotNil(results)
        
        
    }
}


