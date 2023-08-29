//
//  FeedPresenter.swift
//  EssentialFeedIIiOS
//
//  Created by Julius on 29/08/2023.
//


import EssentialFeedII

protocol FeedLoadingView: class {
    func display(isLoading: Bool)// happens in the uirefreshcontrol
}

protocol FeedView {
    func display(feed: [FeedImage]) // happens in the uitableview
}

final class FeedPresenter {
    private let feedLoader: FeedLoader
    typealias Observer<T> = (T) -> Void
    
    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }
    
    weak var feedLoadingView: FeedLoadingView?
    var feedView: FeedView?
    
    
    func loadFeed() {
        feedLoadingView?.display(isLoading: true)
        feedLoader.load { [weak self ] result in
            if let feed = try? result.get() {
                self?.feedView?.display(feed: feed)
            }
            self?.feedLoadingView?.display(isLoading: false)
            
        }
    }
    
}
