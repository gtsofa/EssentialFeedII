//
//  FeedPresenter.swift
//  EssentialFeedIIiOS
//
//  Created by Julius on 29/08/2023.
//


import EssentialFeedII

struct FeedLoadingViewModel {
    let isLoading: Bool
    
}

protocol FeedLoadingView {
    func display(_ viewModel: FeedLoadingViewModel)// happens in the uirefreshcontrol
}

struct FeedViewModel {
    let feed: [FeedImage]
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
    
    func didStartLoadingFeed() {
        feedLoadingView.display(FeedLoadingViewModel(isLoading: true))
    }
    
    func didFinishLoadingFeed(with feed: [FeedImage]) {
        feedView.display(FeedViewModel(feed: feed))
        feedLoadingView.display(FeedLoadingViewModel(isLoading: false))
    }
    
    func didFinishLoading(with error: Error) {
        feedLoadingView.display(FeedLoadingViewModel(isLoading: false))
    }
    
}
