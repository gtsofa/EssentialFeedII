//
//  FeedViewModel.swift
//  EssentialFeedIIiOS
//
//  Created by Julius on 26/08/2023.
//

import Foundation
import EssentialFeedII

final class FeedViewModel {
    private let feedLoader: FeedLoader
    typealias Observer<T> = (T) -> Void
    
    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }
    
    var onLoadingStateChange: Observer<Bool>?//closures to notify changes to views.
    var onFeedLoad: Observer<[FeedImage]>?// closure for notify new feed versions
    
    
    func loadFeed() {
        onLoadingStateChange?(true)
        feedLoader.load { [weak self ] result in
            if let feed = try? result.get() {
                self?.onFeedLoad?(feed)
            }
            self?.onLoadingStateChange?(false)
            
        }
    }
    
}
