//
//  FeedUIComposer.swift
//  EssentialFeedIIiOS
//
//  Created by Julius on 23/08/2023.
//

import Foundation
import EssentialFeedII
import UIKit

public final class FeedUIComposer {
    public init() {}
    
    public static func feedComposedWith(feedLoader: FeedLoader, imageLoader: FeedImageDataLoader) -> FeedViewController {
        let presentationAdapter = FeedLoadPresentationAdapter(feedLoader: MainQueueDispatchDecorator(decoratee: feedLoader))
        let feedController = FeedViewController.makeWith(delegate: presentationAdapter, title: FeedPresenter.title)
        
        
        presentationAdapter.presenter = FeedPresenter(
            feedView: FeedViewAdapter(
                controller: feedController,
                imageLoader: MainQueueDispatchDecorator(decoratee: imageLoader)),
            feedLoadingView: WeakRefVirtualProxy(feedController))
    
        return feedController
    }
}



extension FeedViewController {
    static func makeWith(delegate: FeedViewControllerDelegate, title: String) -> FeedViewController {
        let bundle = Bundle(for: FeedViewController.self)
        let storyboard = UIStoryboard(name: "Feed", bundle: bundle)
        let feedController = storyboard.instantiateInitialViewController() as! FeedViewController//FeedViewController(refreshController: refreshController)
        //set the delegate direct w/o feedrefreshvc
        feedController.delegate = delegate
        feedController.title = FeedPresenter.title
        
        return feedController
    }
}

private final class FeedViewAdapter: FeedView {
    private weak var controller: FeedViewController?
    private let imageLoader: FeedImageDataLoader
    
    init(controller: FeedViewController, imageLoader: FeedImageDataLoader) {
        self.controller = controller
        self.imageLoader = imageLoader
    }
    
    func display(_ viewModel: FeedViewModel) {
        controller?.tableModel = viewModel.feed.map { model in
            let adapter = FeedImageDataLoaderPresentationAdapter<WeakRefVirtualProxy<FeedImageCellController>, UIImage>(model: model, imageLoader: imageLoader)
            let view = FeedImageCellController(delegate: adapter)
            
            adapter.presenter = FeedImagePresenter(
                view: WeakRefVirtualProxy(view),
                imageTransformer: UIImage.init)
            
            return view
        }
    }
}

private final class FeedLoadPresentationAdapter: FeedViewControllerDelegate {
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

