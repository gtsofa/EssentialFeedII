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
    private(set) lazy var view = loadView()
    
    //private let loadFeed: () -> Void
    private let delegate: FeedRefreshViewControllerDelegate
    
    //inject thro constructor injection
    init(delegate: FeedRefreshViewControllerDelegate) {
        self.delegate = delegate
    }
    
    @objc  func refresh() {
        delegate.didRequestFeedRefresh()
        //loadFeed()
    }
    
    func display(_ viewModel: FeedLoadingViewModel) {
        if viewModel.isLoading {
            view.beginRefreshing()
        } else {
            view.endRefreshing()
        }
    }
    
    private func loadView() -> UIRefreshControl {
        let view = UIRefreshControl()
        //binds view with the viewmodel
        view.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        return view
    }
}
