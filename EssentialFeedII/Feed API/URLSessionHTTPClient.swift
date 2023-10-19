//
//  URLSessionHTTPClient.swift
//  EssentialFeedII
//
//  Created by Julius on 02/03/2023.
//

import Foundation

public final class URLSessionHTTPClient: HTTPClient {
    let session: URLSession
    
    public init(session: URLSession) {
        self.session = session
    }
    
    struct UnexpectedValuesRepresentation: Error {}
    
    private struct URLSessionTaskWrapper: HTTPClientTask {
        let wrapped: URLSessionTask
        
        func cancel() {
            wrapped.cancel()
        }
    }
    
    public func get(from url: URL, completion: @escaping (HTTPClient.Result) -> Void) -> HTTPClientTask {
        let task = session.dataTask(with: url) {data,  responnse, error in
            completion(Result {
                if let error = error {
                    throw error
                } else if let data = data, let responnse = responnse as? HTTPURLResponse {
                    return (data, responnse)
                    
                } else {
                    throw UnexpectedValuesRepresentation()
                }
            })
        }
        task.resume()
        return URLSessionTaskWrapper(wrapped: task)
    }
}
