//
//  EndPoint.swift
//  LittleIndia
//
//  Created by Ashish Bogati on 15/07/2022.
//

import Foundation

struct EndPoint {
    var scheme: String // http || https
    var host: String
    var path: String
    var queryItems: [URLQueryItem] = []
    
    init(scheme: String,
         host: String,
         path: String,
         queryItems: [URLQueryItem] = []) {
        self.scheme = scheme
        self.host = host
        self.path = path
        self.queryItems = queryItems
    }
}

extension EndPoint {
    
    var url: URL {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        
        if !queryItems.isEmpty {
            components.queryItems = queryItems
        }
        
        guard let url = components.url else {
            preconditionFailure("Invalid url Componets: \(components)")
        }
        
        return url
    }
}

