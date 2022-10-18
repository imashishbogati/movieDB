//
//  MovieListViewModel.swift
//  MovieDB
//
//  Created by Ashish Bogati on 05/10/2022.
//

import Foundation

class MovieViewModelImplementation: MovieViewModel {
    
    func listTitle(listType: MovieListType) -> String {
        switch listType {
        case .popular:
            return "Popular"
        case .trending:
            return "Trending"
        case .nowPlaying:
            return "Now Playing"
        }
    }
    
    func getMovies(listType: MovieListType,
                   page: String,
                   completion: @escaping (Result<MovieListResponse?, NetworkError>) -> Void) {
        let service = MovieServiceFactory.create(listType: listType,
                                                 page: page)
        service.getMovies { response in
            switch response {
            case .success(let data):
                guaranteeMainThread {
                    completion(.success(data))
                }
            case .failure(let error):
                guaranteeMainThread {
                    completion(.failure(error))
                }
            }
        }
    }
}
