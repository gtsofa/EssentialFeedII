//
//  FeedPresenterTests.swift
//  EssentialFeedIITests
//
//  Created by Julius on 15/09/2023.
//

import XCTest

class FeedPresenter {
    init(view: Any) {}
}

final class FeedPresenterTests: XCTestCase {
    

    func test_init_doesNotSendMessagesToView() {
        let view = ViewSpy()
        
        _ = FeedPresenter(view: view)
        
        XCTAssertTrue(view.messages.isEmpty, "Expected no view messages")
    }
    
    // MARK: - Helpers
    
    private class ViewSpy {
        let messages = [Any]()
    }
}
