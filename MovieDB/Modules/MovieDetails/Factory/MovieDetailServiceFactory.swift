//
//  MovieDetailServiceFactory.swift
//  MovieDB
//
//  Created by Ashish Bogati on 18/10/2022.
//

import Foundation.NSURLSession

class MovieDetailServiceFactory {
    static func create() -> MovieDetailService {
        return MovieDetailServiceImplementation(networkService: NetworkServiceFactory.create())
    }
}
