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
    var feedLoadingView: FeedLoadingView?
    var feedView: FeedView?
    
    func didStartLoadingFeed() {
        feedLoadingView?.display(FeedLoadingViewModel(isLoading: true))
    }
    
    func didFinishLoadingFeed(with feed: [FeedImage]) {
        feedView?.display(FeedViewModel(feed: feed))
        feedLoadingView?.display(FeedLoadingViewModel(isLoading: false))
    }
    
    func didFinishLoading(with error: Error) {
        feedLoadingView?.display(FeedLoadingViewModel(isLoading: false))
    }
    
}
