//
//  SharedTestHelpers.swift
//  EssentialFeedIITests
//
//  Created by Julius on 23/09/2023.
//

import Foundation

func anyURL() -> URL {
    return URL(string: "https://any-url.com")!
}

func anyData() -> Data {
    return Data(_: "any data".utf8)
}

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 1)
}
