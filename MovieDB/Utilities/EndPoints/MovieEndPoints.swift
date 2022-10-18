//
//  MovieEndPoints.swift
//  MovieDB
//
//  Created by Ashish Bogati on 05/10/2022.
//

import Foundation

struct MovieEndPoint {
    var path: String
    var page: String?
    var queryItems: [URLQueryItem] = []
    
    init(path: String,
         page: String? = nil,
         queryItems: [URLQueryItem] = []) {
        self.path = path
        self.page = page
        self.queryItems = queryItems
    }
    
    private func createMovieListQueryParameters() -> [URLQueryItem] {
        var queryItems: [URLQueryItem] = []
        self.queryItems.forEach { item in
            queryItems.append(item)
        }
        queryItems.append(.init(name: "api_key", value: "3b3a5c9efef85e4f2077f780db7e4b3c"))
        if self.page != nil {
            queryItems.append(.init(name: "page", value: page))
        }
        
        return queryItems
    }
    
    func createEndPoint() -> EndPoint {
        return EndPoint(scheme: "https",
                        host: "api.themoviedb.org",
                        path: "/3/" + self.path,
                        queryItems: createMovieListQueryParameters())
    }
}
