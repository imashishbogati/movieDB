//
//  UseCaseInterface.swift
//  MovieDB
//
//  Created by Ashish Bogati on 05/10/2022.
//

import Foundation


protocol UseCaseInterface {
    func getMovies(request: MovieListRequest,
                  completion: @escaping (Result<MovieListResponse, NetworkError>) -> Void)
}
