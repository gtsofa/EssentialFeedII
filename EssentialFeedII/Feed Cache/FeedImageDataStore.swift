//
//  FeedImageDataStore.swift
//  EssentialFeedII
//
//  Created by Julius on 24/10/2023.
//

import Foundation

public protocol FeedImageDataStore {
    typealias Result = Swift.Result<Data?, Error>
    func retrieve(dataFor url: URL, completion: @escaping (Result) -> Void)
}
