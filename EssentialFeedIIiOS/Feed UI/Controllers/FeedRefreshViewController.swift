//
//  FeedRefreshViewController.swift
//  EssentialFeedIIiOS
//
//  Created by Julius on 23/08/2023.
//

import UIKit

protocol FeedRefreshViewControllerDelegate {
    func didRequestFeedRefresh()
}

final class FeedRefreshViewController: NSObject, FeedLoadingView {
    @IBOutlet private var view:  UIRefreshControl?
    
    //private let loadFeed: () -> Void
    var delegate: FeedRefreshViewControllerDelegate?
    
    @IBAction  func refresh() {
        delegate?.didRequestFeedRefresh()
        //loadFeed()
    }
    
    func display(_ viewModel: FeedLoadingViewModel) {
        if viewModel.isLoading {
            view?.beginRefreshing()
        } else {
            view?.endRefreshing()
        }
    }
}
