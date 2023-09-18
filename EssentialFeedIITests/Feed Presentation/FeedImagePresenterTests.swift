//
//  FeedImagePresenterTests.swift
//  EssentialFeedIITests
//
//  Created by Julius on 18/09/2023.
//

import XCTest

final class FeedImagePresenter {
    init(view: Any) {}
}

final class FeedImagePresenterTests: XCTestCase {
    func test_init_doesNotSendMessagesToView() {
        let view = ViewSpy()
        _ = FeedImagePresenter(view: view)
        XCTAssertTrue(view.messages.isEmpty, "Expected no view messages")
    }
    
    // MARK: - Helpers
    
    class ViewSpy {
        let messages = [Any]()
    }

}
