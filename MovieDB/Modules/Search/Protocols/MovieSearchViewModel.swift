//
//  MovieSearchViewModeProtocol.swift
//  MovieDB
//
//  Created by Ashish Bogati on 11/10/2022.
//

protocol MovieSearchViewModel {
    func getSearchResult(completion: @escaping (Result<MovieListResponse?, NetworkError>) -> Void)
    func getQueryString() -> String
}
