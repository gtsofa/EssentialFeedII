//
//  SharedTestHelpers.swift
//  EssentialAppTests
//
//  Created by Julius on 07/11/2023.
//

import Foundation
import EssentialFeedII

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}

func anyURL() -> URL {
    return URL(string: "https://any-url.com")!
}

func anyData() -> Data {
    return Data("any data".utf8)
}

func uniqueFeed() -> [FeedImage] {
    return [FeedImage(id: UUID(), description: "any", location: "any", url: URL(string: "https://any-url.com")!)]
}
