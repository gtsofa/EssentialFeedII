//
//  FeedViewControllerTests.swift
//  EssentialFeedIIiOSTests
//
//  Created by Julius on 05/03/2023.
//

import XCTest

class FeedViewController {
    init(loader: FeedViewControllerTests.LoaderSpy){}
}

final class FeedViewControllerTests: XCTestCase {
    
    func test_init_doesNotLoadFeed() {
        let loader = LoaderSpy()
        _ = FeedViewController(loader: loader)
        
        XCTAssertEqual(loader.loadCallCount, 0)
    }
    
    
    class LoaderSpy {
        var loadCallCount: Int = 0
    }

}
