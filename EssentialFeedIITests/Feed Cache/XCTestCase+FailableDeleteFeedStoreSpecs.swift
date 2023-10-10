//
//  XCTestCase+FailableDeleteFeedStoreSpecs.swift
//  EssentialFeedIITests
//
//  Created by Julius on 10/10/2023.
//

import XCTest
import EssentialFeedII

extension FailableDeleteFeedStoreSpecs where Self: XCTestCase {
    func assertThatDeleteDeliversErrorOnDeletionError(on sut: FeedStore, file: StaticString = #filePath, line: UInt = #line) {
        let deletionError = deleteCache(from: sut)
        
        XCTAssertNotNil(deletionError, "Expected cache deletion to fail")
    }
    
    func assertThatDeleteHasNoSideEffectsOnDeletionError(on sut: FeedStore, file: StaticString = #filePath, line: UInt = #line) {
        deleteCache(from: sut)
        expect(sut, toRetrieve: .empty)
    }

}
