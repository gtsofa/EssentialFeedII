//
//  FeedLoaderPresentationAdapter.swift
//  EssentialFeedIIiOS
//
//  Created by Julius on 05/09/2023.
//
import Combine
import EssentialFeedII
import EssentialFeedIIiOS

final class FeedLoaderPresentationAdapter: FeedViewControllerDelegate {
    // has loader + presenter dependency
    private let feedLoader: () -> FeedLoader.Publisher
    private var cancellable: Cancellable?
    var  presenter: FeedPresenter?
    
    init(feedLoader: @escaping () -> FeedLoader.Publisher) {
        self.feedLoader = feedLoader
    }
    
    // logic to communicate with feed component
    func didRequestFeedRefresh() {
        presenter?.didStartLoadingFeed()
        
        cancellable = feedLoader().sink(
            receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished: break
                case let .failure(error):
                    self?.presenter?.didFinishLoading(with: error)
                }
            }, receiveValue: { [weak self] feed in
                self?.presenter?.didFinishLoadingFeed(with: feed)
            })
    }
}
