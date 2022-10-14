//
//  SearchUseCaseProtocol.swift
//  MovieDB
//
//  Created by Ashish Bogati on 11/10/2022.
//

import Foundation

protocol SearchUseCaseProtocol {
    func getSearchMovie(query: String,
                   completion: @escaping (Result<MovieListResponse, NetworkError>) -> Void)
}
