//
//  FeedPresenter.swift
//  EssentialFeedIIiOS
//
//  Created by Julius on 29/08/2023.
//


import EssentialFeedII
import Foundation

protocol FeedLoadingView {
    func display(_ viewModel: FeedLoadingViewModel)// happens in the uirefreshcontrol
}

protocol FeedView {
    func display(_ viewModel: FeedViewModel) // happens in the uitableview
}

final class FeedPresenter {
    // a presenter must have a view - our design needs refactoring!
    private let feedView: FeedView
    private let feedLoadingView: FeedLoadingView
    
    init(feedView: FeedView, feedLoadingView: FeedLoadingView) {
        self.feedView = feedView
        self.feedLoadingView = feedLoadingView
    }
    
    static var title: String {
        return NSLocalizedString("FEED_VIEW_TITLE",
                                 tableName: "Feed",
                                 bundle: Bundle(for: FeedPresenter.self),
                                 comment: "Title for the feed view")
    }
    
    func didStartLoadingFeed() {
        guard Thread.isMainThread else {
            return DispatchQueue.main.async { [weak self] in
                
                self?.didStartLoadingFeed()
            }
        }
        feedLoadingView.display(FeedLoadingViewModel(isLoading: true))
    }
    
    func didFinishLoadingFeed(with feed: [FeedImage]) {
        guard Thread.isMainThread else {
            return DispatchQueue.main.async { [weak self] in
                
                self?.didFinishLoadingFeed(with: feed)
            }
        }
        
        feedView.display(FeedViewModel(feed: feed))
        feedLoadingView.display(FeedLoadingViewModel(isLoading: false))
    }
    
    func didFinishLoading(with error: Error) {
        guard Thread.isMainThread else {
            return DispatchQueue.main.async { [weak self] in
                
                self?.didFinishLoading(with: error)
            }
        }
        feedLoadingView.display(FeedLoadingViewModel(isLoading: false))
    }
    
}
