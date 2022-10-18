//
//  MovieSearchService.swift
//  MovieDB
//
//  Created by Ashish Bogati on 18/10/2022.
//

protocol MovieSearchService {
    func getSearchMovie(query: String,
                   completion: @escaping (Result<MovieListResponse?, NetworkError>) -> Void)
}
