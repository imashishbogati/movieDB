//
//  HomeViewModelInterface.swift
//  MovieDB
//
//  Created by Ashish Bogati on 05/10/2022.
//

import Foundation

enum ListType {
    case popular
    case trending
}

protocol HomeViewModelInterface {
    
}

protocol MovieListViewModelInterface {
    func listTitle(list: ListType) -> String
    func getMovies(request: MovieListRequest,
                   completion: @escaping (Result<MovieListResponse, NetworkError>) -> Void)
}


