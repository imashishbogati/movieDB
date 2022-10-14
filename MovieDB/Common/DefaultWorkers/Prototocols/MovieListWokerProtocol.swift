//
//  MovieListWokerProtocol.swift
//  MovieDB
//
//  Created by Ashish Bogati on 05/10/2022.
//

import Foundation

protocol MovieListWokerProtocol {
    var networkService: NetworkService { get set }
    func getMovies(request: URLRequest,
                   completion: @escaping (Result<Data?, NetworkError>) -> Void)
}
