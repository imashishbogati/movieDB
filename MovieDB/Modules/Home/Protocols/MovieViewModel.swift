//
//  MovieListViewModelProtocol.swift
//  MovieDB
//
//  Created by Ashish Bogati on 05/10/2022.
//

import Foundation

protocol MovieViewModel {
    func listTitle(listType: MovieListType) -> String
    func getMovies(listType: MovieListType,
                   page: String,
                   completion: @escaping (Result<MovieListResponse?, NetworkError>) -> Void)
}


