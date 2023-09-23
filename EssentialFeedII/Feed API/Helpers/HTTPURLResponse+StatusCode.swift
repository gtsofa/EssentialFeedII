//
//  HTTPURLResponse+StatusCode.swift
//  EssentialFeedII
//
//  Created by Julius on 24/09/2023.
//

import Foundation

extension HTTPURLResponse {
    private static var OK_200: Int { return 200 }
    
    var isOK: Bool {
        return statusCode == HTTPURLResponse.OK_200
    }
}
