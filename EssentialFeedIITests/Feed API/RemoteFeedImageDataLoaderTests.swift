//
//  RemoteFeedImageDataLoaderTests.swift
//  EssentialFeedIITests
//
//  Created by Julius on 19/09/2023.
//

import XCTest

final class RemoteFeedImageDataLoader {
    init(client: Any) {}
}

final class RemoteFeedImageDataLoaderTests: XCTestCase {
    func test_init_doesNotPerformAnyURLRequest() {
        let client = HTTPClientSpy()
        _ = RemoteFeedImageDataLoader(client: client)
        
        XCTAssertEqual(client.requestedURLs, [])
    }
    
    // MARK:- Helpers
    
    class HTTPClientSpy {
        var requestedURLs = [URL]()
    }

}
