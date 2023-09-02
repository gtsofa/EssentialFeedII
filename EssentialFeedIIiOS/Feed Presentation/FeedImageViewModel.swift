//
//  FeedImageViewModel.swift
//  EssentialFeedIIiOS
//
//  Created by Julius on 28/08/2023.
//
import Foundation
import EssentialFeedII

struct FeedImageViewModel<Image> {
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool
    
    var hasLocation: Bool {
        return location != nil
    }
    
}
