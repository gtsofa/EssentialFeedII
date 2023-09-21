//
//  RemoteFeedImageDataLoaderTests.swift
//  EssentialFeedIITests
//
//  Created by Julius on 19/09/2023.
//

import XCTest
import EssentialFeedII

final class RemoteFeedImageDataLoader {
    private let client: Any
    
    init(client: Any) {
        self.client = client
    }
}

final class RemoteFeedImageDataLoaderTests: XCTestCase {
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        let sut = RemoteFeedImageDataLoader(client: client)
        XCTAssertEqual(client.requestedURLs, [])
    }
    
    // MARK: - Helpers
    
    class HTTPClientSpy {
        let requestedURLs = [URL]()
    }
}
