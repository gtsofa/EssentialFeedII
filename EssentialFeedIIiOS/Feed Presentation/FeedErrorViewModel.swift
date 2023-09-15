//
//  FeedErrorViewModel.swift
//  EssentialFeedIIiOS
//
//  Created by Julius on 15/09/2023.
//

import Foundation

struct FeedErrorViewModel {
    let message: String?
    
    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}
