//
//  NetworkServiceFactory.swift
//  MovieDB
//
//  Created by Ashish Bogati on 18/10/2022.
//

import Foundation

class NetworkServiceFactory {
    static func create(dataLoader: NetworkLoader = URLSession.shared) -> NetworkService {
        return NetworkServiceImplementation(dataLoader: dataLoader)
    }
}
