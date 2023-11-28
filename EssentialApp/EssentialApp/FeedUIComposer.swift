//
//  FeedUIComposer.swift
//  EssentialFeedIIiOS
//
//  Created by Julius on 23/08/2023.
//

import UIKit
import Combine
import EssentialFeedII
import EssentialFeedIIiOS

public final class FeedUIComposer {
    public init() {}
    
    public static func feedComposedWith(feedLoader: @escaping () ->  FeedLoader.Publisher, imageLoader: @escaping (URL) -> FeedImageDataLoader.Publisher) -> FeedViewController {
        let presentationAdapter = FeedLoaderPresentationAdapter(feedLoader:
                                                                    { feedLoader().dispatchOnMainQueue() })
        let feedController = makeFeedViewController(delegate: presentationAdapter, title: FeedPresenter.title)
        
        
        presentationAdapter.presenter = FeedPresenter(
            feedView: FeedViewAdapter(
                controller: feedController,
                imageLoader: { imageLoader($0).dispatchOnMainQueue() }),
            feedLoadingView: WeakRefVirtualProxy(feedController),
            errorView: WeakRefVirtualProxy(feedController))
    
        return feedController
    }
    
    
    private static func makeFeedViewController(delegate: FeedViewControllerDelegate, title: String) -> FeedViewController {
        let bundle = Bundle(for: FeedViewController.self)
        let storyboard = UIStoryboard(name: "Feed", bundle: bundle)
        let feedController = storyboard.instantiateInitialViewController() as! FeedViewController//FeedViewController(refreshController: refreshController)
        //set the delegate direct w/o feedrefreshvc
        feedController.delegate = delegate
        feedController.title = FeedPresenter.title
        
        return feedController
    }
}



