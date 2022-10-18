//
//  MovieServiceFactory.swift
//  MovieDB
//
//  Created by Ashish Bogati on 17/10/2022.
//

import Foundation

class MovieServiceFactory {
    
    static func create(listType: MovieListType, page: String) -> MovieService {
        switch listType {
        case .popular:
            return MovieServiceImplementation(networkService: NetworkServiceFactory.create(),
                                              page: page,
                                              listType: .popular)
        case .trending:
            return MovieServiceImplementation(networkService: NetworkServiceFactory.create(),
                                              page: page,
                                              listType: .trending)
        case .nowPlaying:
            return MovieServiceImplementation(networkService: NetworkServiceFactory.create(),
                                              page: page,
                                              listType: .nowPlaying)
        }
    }
    
}
