//
//  CastServiceFactory.swift
//  MovieDB
//
//  Created by Ashish Bogati on 18/10/2022.
//

class CastServiceFactory {
    static func create() -> CastService {
        return CastServiceImplementation(networkService: NetworkServiceFactory.create())
    }
}

