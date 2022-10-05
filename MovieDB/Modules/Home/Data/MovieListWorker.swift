//
//  MovieListWorker.swift
//  MovieDB
//
//  Created by Ashish Bogati on 05/10/2022.
//

import Foundation

final class MovieListWorker: MovieListWokerInterface {
    
    var networkService: NetworkService
    
    init(networkService: NetworkService = NetworkService()) {
        self.networkService = networkService
    }
    
    func getMovies(request: URLRequest,
                   completion: @escaping (Result<Data?, NetworkError>) -> Void) {
        networkService.dataLoader.loadData(using: request) { data, response, error in
            
            if let response = response as? HTTPURLResponse {
                let statusCode = response.statusCode
                if statusCode != 200 {
                    completion(.failure(.requestError(.invalidRequest(request))))
                }
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            if let error = error {
                completion(.failure(error))
            }
            
            
            
            completion(.success(data))
        }
    }
    
    
}
