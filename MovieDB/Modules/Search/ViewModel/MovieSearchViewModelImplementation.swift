//
//  MovieSearchViewModel.swift
//  MovieDB
//
//  Created by Ashish Bogati on 11/10/2022.
//

import Foundation

// MARK: - SearchViewModel

final class MovieSearchViewModelImplementation: MovieSearchViewModel {
    
    private let service: MovieSearchService
    private let query: String
    
    init(service: MovieSearchService, query: String) {
        self.service = service
        self.query = query
    }
    
    private func isValidQuery() -> Bool {
        return query != ""
    }
    
    func getSearchResult(completion: @escaping (Result<MovieListResponse?, NetworkError>) -> Void) {
        if isValidQuery() {
            service.getSearchMovie(query: query) { response in
                switch response {
                case .success(let movieList):
                    guaranteeMainThread {
                        completion(.success(movieList))
                    }
                case .failure(let error):
                    guaranteeMainThread {
                        completion(.failure(error))
                    }
                }
            }
        }
        
    }
    
    func getQueryString() -> String {
        return query
    }
    
    
}
