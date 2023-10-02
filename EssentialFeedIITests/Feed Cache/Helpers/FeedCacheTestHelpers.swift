//
//  FeedCacheTestHelpers.swift
//  EssentialFeedIITests
//
//  Created by Julius on 02/10/2023.
//

import Foundation
import EssentialFeedII

func uniqueImage() -> FeedImage {
    return FeedImage(id: UUID(), description: "any", location: "any", url: anyURL())
}

func uniqueFeedImage() -> (models: [FeedImage], local: [LocalFeedItem]) {
    let models = [uniqueImage(), uniqueImage()]
    let local = models.map { LocalFeedItem(id: $0.id, description: $0.description, location: $0.location, url: $0.url)}
    
    return (models, local)
}

extension Date {
    func adding(days: Int) -> Date {
        return Calendar(identifier: .gregorian).date(byAdding: .day, value: days, to:  self)!
    }
    
    func adding(seconds: TimeInterval) -> Date {
        return self + seconds
    }
}