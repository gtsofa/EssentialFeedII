//
//  FeedLoaderStub.swift
//  EssentialAppTests
//
//  Created by Julius on 09/11/2023.
//

import Foundation
import EssentialFeedII

class FeedLoaderStub: FeedLoader {
    private let result:  FeedLoader.Result
    
    init(result: FeedLoader.Result) {
        self.result = result
    }
    
    func load(completion: @escaping (FeedLoader.Result) -> Void) {
        completion(result)
    }
}
