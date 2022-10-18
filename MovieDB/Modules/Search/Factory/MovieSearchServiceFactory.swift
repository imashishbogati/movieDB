//
//  SearchServiceFactory.swift
//  MovieDB
//
//  Created by Ashish Bogati on 18/10/2022.
//

class MovieSearchServiceFactory {
    static func create() -> MovieSearchService {
        return MovieSearchServiceImplementation(networkService: NetworkServiceFactory.create())
    }
}
