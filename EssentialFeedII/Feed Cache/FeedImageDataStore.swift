//
//  FeedImageDataStore.swift
//  EssentialFeedII
//
//  Created by Julius on 24/10/2023.
//

import Foundation

public protocol FeedImageDataStore {
    typealias Result = Swift.Result<Data?, Error>
    typealias InsertionResult = Swift.Result<Void, Error>
    
    func insert(_ data: Data, for url: URL, completion: @escaping (InsertionResult) -> Void)
    
    func retrieve(dataFor url: URL, completion: @escaping (Result) -> Void)
}
