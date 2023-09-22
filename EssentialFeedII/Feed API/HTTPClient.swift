//
//  HTTPClient.swift
//  EssentialFeedII
//
//  Created by Julius on 02/03/2023.
//

import Foundation

public protocol HTTPClientTask {
    func cancel()
}

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void) -> HTTPClientTask
}
