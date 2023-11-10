//
//  FeedCache.swift
//  EssentialFeedII
//
//  Created by Julius on 09/11/2023.
//

import Foundation

public protocol FeedCache {
    typealias Result = Swift.Result<Void, Error>
    
    func save(_ items: [FeedImage], completion: @escaping (Result) -> Void)
}
