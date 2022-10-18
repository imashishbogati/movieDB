//
//  MovieService.swift
//  MovieDB
//
//  Created by Ashish Bogati on 17/10/2022.
//

protocol MovieService {
    func getMovies(completion: @escaping (Result<MovieListResponse?, NetworkError>) -> Void)
}
