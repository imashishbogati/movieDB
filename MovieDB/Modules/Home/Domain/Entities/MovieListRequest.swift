//
//  MovieListRequest.swift
//  MovieDB
//
//  Created by Ashish Bogati on 05/10/2022.
//

import Foundation

// MARK: - MovieListRequest

struct MovieListRequest {
    var page: String
    var listType: ListType = .popular
}
