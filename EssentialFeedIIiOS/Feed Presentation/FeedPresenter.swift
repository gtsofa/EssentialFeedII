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

protocol FeedErrorView {
    func display(_ viewModel: FeedErrorViewModel)
}

final class FeedPresenter {
    // a presenter must have a view - our design needs refactoring!
    private let feedView: FeedView
    private let feedLoadingView: FeedLoadingView
    private let errorView: FeedErrorView
    
    init(feedView: FeedView, feedLoadingView: FeedLoadingView, errorView: FeedErrorView) {
        self.feedView = feedView
        self.feedLoadingView = feedLoadingView
        self.errorView = errorView
    }
    
    static var title: String {
        return NSLocalizedString("FEED_VIEW_TITLE",
                                 tableName: "Feed",
                                 bundle: Bundle(for: FeedPresenter.self),
                                 comment: "Title for the feed view")
    }
    
    private var feedLoadError: String {
        return NSLocalizedString("FEED_VIEW_CONNECTION_ERROR",
                                 tableName: "Feed",
                                 bundle: Bundle(for: FeedPresenter.self),
                                 comment: "Error message displayed when we can't load the image feed from the server")
    }
    
    func didStartLoadingFeed() {
        errorView.display(FeedErrorViewModel(message: nil))
        feedLoadingView.display(FeedLoadingViewModel(isLoading: true))
    }
    
    func didFinishLoadingFeed(with feed: [FeedImage]) {
        feedView.display(FeedViewModel(feed: feed))
        feedLoadingView.display(FeedLoadingViewModel(isLoading: false))
    }
    
    func didFinishLoading(with error: Error) {
        errorView.display(FeedErrorViewModel(message: feedLoadError))
        feedLoadingView.display(FeedLoadingViewModel(isLoading: false))
    }
    
}
