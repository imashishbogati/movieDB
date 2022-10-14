//
//  MovieWorker.swift
//  MovieDB
//
//  Created by Ashish Bogati on 07/10/2022.
//

import Foundation

final class MovieWorker: MovieListWokerProtocol {
    
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
