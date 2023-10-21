//
//  LocalFeedImageDataLoaderUseCaseTests.swift
//  EssentialFeedIITests
//
//  Created by Julius on 21/10/2023.
//

import XCTest

final class LocalFeedImageDataLoader {
    init(store: Any) {}
}

final class LocalFeedImageDataLoaderUseCaseTests: XCTestCase {
    func test_init_doesNotMessageStoreUponCreation() {
        let store = FeedStoreSpy()
        _ = LocalFeedImageDataLoader(store: store)
        
        XCTAssertTrue(store.receivedMessages.isEmpty)
    }
}
