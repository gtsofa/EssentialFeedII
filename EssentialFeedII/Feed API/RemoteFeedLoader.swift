//
//  RemoteFeedLoader.swift
//  EssentialFeedII
//
//  Created by Julius on 02/03/2023.
//

import Foundation

public final class RemoteFeedLoader: FeedLoader {
    
    private let client: HTTPClient
    private let url: URL
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    
    public func load(completion: @escaping (FeedLoader.Result) -> Void ) {
        client.get(from: url) { [weak self ] result in
            guard self != nil else { return }
            
            switch result {
            case let .success(data, response):
                completion(FeedItemsMapper.map(data, response))
                
            case .failure:
                completion(.failure(Error.connectivity))
            }
            
        }
    }
}
