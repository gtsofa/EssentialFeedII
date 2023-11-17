//
//  FeedViewControllerTests+Localization.swift
//  EssentialFeedIIiOSTests
//
//  Created by Julius on 04/09/2023.
//

import Foundation
import XCTest
import EssentialFeedII

extension FeedUIIntegrationTests {
    func localized(_ key: String, file: StaticString = #filePath, line: UInt = #line) -> String {
        let table = "Feed"
        let bundle = Bundle(for: FeedPresenter.self)
        let value = bundle.localizedString(forKey: key, value: nil, table: table)
        if value == key {
            XCTFail("Missing localized string for key: \(key) in table \(table)", file: file, line: line)
        }
        return value
    }
}
