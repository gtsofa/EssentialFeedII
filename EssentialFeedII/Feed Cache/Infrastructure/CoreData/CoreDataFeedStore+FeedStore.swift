//
//  CoreDataFeedStore+FeedStore.swift
//  EssentialFeedII
//
//  Created by Julius on 27/10/2023.
//

import Foundation

extension CoreDataFeedStore: FeedStore {
    public func retrieve(completion: @escaping RetrievalCompletion) {
        perform { context in
            completion(Result {
                try ManagedCache.find(in: context).map {
                    (CachedFeed(feed: $0.localFeed, timestamp: $0.timestamp))
                }
            })
        }
    }
    
    public func insert(_ items: [EssentialFeedII.LocalFeedItem], timestamp: Date, completion: @escaping InsertionCompletion) {
        perform { context in
            completion(Result {
                let managedCache = try ManagedCache.newUniqueInstance(in: context)
                managedCache.timestamp = timestamp
                managedCache.feed = ManagedFeedImage.images(from: items, in: context)
                try context.save()
            })
        }
    }
    
    public func deleteCacheFeed(completion: @escaping DeletionCompletion) {
        perform { context in
            completion(Result {
                try ManagedCache.find(in: context).map(context.delete).map(context.save)
            })
        }
    }
}
