//
//  FeedLoaderPresentationAdapter.swift
//  EssentialFeedIIiOS
//
//  Created by Julius on 05/09/2023.
//

import EssentialFeedII
import EssentialFeedIIiOS

final class FeedLoaderPresentationAdapter: FeedViewControllerDelegate {
    // has loader + presenter dependency
    private let feedLoader: FeedLoader
    var  presenter: FeedPresenter?
    
    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }
    
    // logic to communicate with feed component
    func didRequestFeedRefresh() {
        presenter?.didStartLoadingFeed()
        
        feedLoader.load { [weak self] result in
            switch result {
            case let .success(feed):
                self?.presenter?.didFinishLoadingFeed(with: feed)
            case let .failure(error):
                self?.presenter?.didFinishLoading(with: error)
            }
        }
    }
}
