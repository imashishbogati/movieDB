//
//  MovieListViewModel.swift
//  MovieDB
//
//  Created by Ashish Bogati on 05/10/2022.
//

import Foundation

// MARK: - MovieListViewModel

final class MovieListViewModel: MovieListViewModelInterface {
    private var useCase: MovieListUseCaseInterface
    
    init(useCase: MovieListUseCaseInterface) {
        self.useCase = useCase
    }
    
    func listTitle(list: MovieListType) -> String {
        switch list {
        case .popular:
            return "Popular"
        case .trending:
            return "Trending"
        case .nowPlaying:
            return "Now Playing"
        }
    }
    
    func getMovies(request: MovieListRequest,
                   completion: @escaping (Result<MovieListResponse, NetworkError>) -> Void) {
        useCase.getMovies(request: request) { response in
            switch response {
            case .success(let data):
                guarenteeMainThread {
                    completion(.success(data))
                }
                
            case .failure(let failure):
                guarenteeMainThread {
                    completion(.failure(failure))
                }
                
            }
        }
    }
}
