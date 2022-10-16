//
//  NetworkService.swift
//  LittleIndia
//
//  Created by Ashish Bogati on 15/07/2022.
//

import Foundation
import OSLog

protocol NetworkService: AnyObject {
    
    func createRequest(requestEndpoint: URL, method: HTTPMethod, headerType: HTTPHeaderType?, headerValue: HTTPHeaderValue?) -> URLRequest
}

class NetworkServiceImplementation : NetworkService {
    
    var dataLoader: NetworkLoader
    
    //FIXME: What does this loader do? and why is it being initialized in the constructor?
    init(dataLoader: NetworkLoader = URLSession.shared) {
        self.dataLoader = dataLoader
    }
    
    // MARK: Public
    func createRequest(requestEndpoint: URL,
                       method: HTTPMethod,
                       headerType: HTTPHeaderType? = nil,
                       headerValue: HTTPHeaderValue? = nil) -> URLRequest {
        
        var request = URLRequest(url: requestEndpoint) // FIXME: Use URLRequest as parameter
        request.httpMethod = method.rawValue
        
        if let headerType = headerType,
           let headerValue = headerValue {
            request.setValue(headerValue.rawValue, forHTTPHeaderField: headerType.rawValue)
        }
        
        return request
    }
}
