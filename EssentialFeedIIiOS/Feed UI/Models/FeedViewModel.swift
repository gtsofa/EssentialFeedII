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
    
    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }
    
    var onChange: ((FeedViewModel) -> Void)?//closures to notify changes to views.
    var onFeedLoad: (([FeedImage]) -> Void)?
    
    // feed accessors
    private(set) var isLoading: Bool = false {
        didSet { onChange?(self)}
    }
    
    
    func loadFeed() {
        isLoading = true
        feedLoader.load { [weak self ] result in
            if let feed = try? result.get() {
                self?.onFeedLoad?(feed)
            }
            self?.isLoading = false
            
        }
    }
    
}
