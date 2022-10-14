//
//  MovieSearchViewModeProtocol.swift
//  MovieDB
//
//  Created by Ashish Bogati on 11/10/2022.
//

import Foundation

protocol MovieSearchViewModeProtocol {
    func getSearchResult(completion: @escaping (Result<MovieListResponse, NetworkError>) -> Void)
    func getQueryString() -> String
}
