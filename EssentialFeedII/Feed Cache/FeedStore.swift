//
//  FeedStore.swift
//  EssentialFeedII
//
//  Created by Julius on 28/09/2023.
//

import Foundation

public protocol FeedStore {
    typealias  DeletionCompletion = (Error?) -> Void
    typealias InsertionCompletion = (Error?) -> Void
    
    func deleteCacheFeed(completion: @escaping DeletionCompletion)
    func insert(_ items: [LocalFeedItem], timestamp: Date, completion: @escaping InsertionCompletion)
}
