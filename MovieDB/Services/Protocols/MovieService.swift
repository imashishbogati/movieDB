//
//  MovieListWorkerProtocol.swift
//  MovieDB
//
//  Created by Ashish Bogati on 05/10/2022.
//

import Foundation

protocol MovieService {
    func getMovies(request: URLRequest,completion: @escaping (Result<Data?, NetworkError>) -> Void)
}
