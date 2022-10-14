//
//  MovieSearchViewModel.swift
//  MovieDB
//
//  Created by Ashish Bogati on 11/10/2022.
//

import Foundation

// MARK: - SearchViewModel

final class MovieSearchViewModel: MovieSearchViewModeProtocol {
    
    private var useCase: SearchUseCaseProtocol
    private var query: String
    init(useCase: SearchUseCaseProtocol = MovieSearchUseCase(), query: String) {
        self.useCase = useCase
        self.query = query
    }
    
    private func isValidQuery() -> Bool {
        return query != ""
    }
    
    func getSearchResult(completion: @escaping (Result<MovieListResponse, NetworkError>) -> Void) {
        if isValidQuery() {
            useCase.getSearchMovie(query: query) { response in
                switch response {
                case .success(let movieList):
                    guarenteeMainThread {
                        completion(.success(movieList))
                    }
                case .failure(let error):
                    guarenteeMainThread {
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
