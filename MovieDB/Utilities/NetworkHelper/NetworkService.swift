//
//  NetworkService.swift
//  LittleIndia
//
//  Created by Ashish Bogati on 15/07/2022.
//

import Foundation
import OSLog

final class NetworkService {
    enum HTTPMethod: String {
        case get = "GET"
        case patch = "PATCH"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
    }
    
    enum HTTPHeaderType: String {
        case contentType = "Content-Type"
    }
    
    enum HTTPHeaderValue: String {
        case json = "application/json"
        case multipart = "multipart/form-data"
        case formData = "application/x-www-form-urlencoded charset=utf-8"
    }
    
    var dataLoader: NetworkLoader
    
    init(dataLoader: NetworkLoader = URLSession.shared) {
        self.dataLoader = dataLoader
    }
    
    // MARK: - Public
    func createRequest(url: URL?,
                       method: HTTPMethod,
                       headerType: HTTPHeaderType? = nil,
                       headerValue: HTTPHeaderValue? = nil) -> URLRequest? {
        guard let requestURL = url else {
            NSLog("request URL is nil")
            return nil
        }
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        
        if let headerType = headerType,
           let headerValue = headerValue {
            request.setValue(headerValue.rawValue, forHTTPHeaderField: headerType.rawValue)
        }
        
        return request
    }
}
