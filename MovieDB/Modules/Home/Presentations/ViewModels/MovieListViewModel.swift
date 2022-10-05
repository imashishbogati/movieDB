//
//  MovieListViewModel.swift
//  MovieDB
//
//  Created by Ashish Bogati on 05/10/2022.
//

import Foundation

// MARK: - MovieListViewModel

final class MovieListViewModel: MovieListViewModelInterface {
    private var useCase: UseCaseInterface
    
    init(useCase: UseCaseInterface) {
        self.useCase = useCase
    }
    
    func listTitle(list: ListType) -> String {
        switch list {
        case .popular:
            return "Popular"
        case .trending:
            return "Trending"
        }
    }
    
    func getMovies(request: MovieListRequest,
                   completion: @escaping (Result<MovieListResponse, NetworkError>) -> Void) {
        useCase.getMovies(request: request) { response in
            switch response {
            case .success(let data):
                completion(.success(data))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
    
    
}
