//
//  FeedImageDataCache.swift
//  EssentialFeedII
//
//  Created by Julius on 10/11/2023.
//

import Foundation

public protocol FeedImageDataCache {
    typealias Result = Swift.Result<Void, Error>
    
    func save(_ data: Data, for url: URL, completion: @escaping (Result) -> Void)
}
