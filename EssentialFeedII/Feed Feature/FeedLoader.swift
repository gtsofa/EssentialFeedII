//
//  FeedLoader.swift
//  EssentialFeedII
//
//  Created by Julius on 02/03/2023.
//

import Foundation

public protocol FeedLoader {
    typealias Result = Swift.Result<[FeedItem], Error>
    
    func load(completion: @escaping (Result) -> Void)
}
