//
//  URLSessionHTTPClient.swift
//  EssentialFeedII
//
//  Created by Julius on 02/03/2023.
//

import Foundation

public class URLSessionHTTPClient: HTTPClient {
    let session: URLSession
    
    public init(session: URLSession = .shared) {
        self.session = session
    }
    
    struct UnexpectedValuesRepresentation: Error {}
    
    public func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void) {
        session.dataTask(with: url) {data,  responnse, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data, let responnse = responnse as? HTTPURLResponse {
                completion(.success(data, responnse))
                
            } else {
                completion(.failure(UnexpectedValuesRepresentation()))
            }
            
        }.resume()
    }
}
