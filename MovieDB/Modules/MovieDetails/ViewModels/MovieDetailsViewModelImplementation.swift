//
//  MovieDetailsViewModel.swift
//  MovieDB
//
//  Created by Ashish Bogati on 07/10/2022.
//

import Foundation

class MovieDetailsViewModelImplementation: MovieDetailViewModel {
    
    private let service: MovieDetailService
    private let movieID: Int
    
    init(movieID: Int, service: MovieDetailService) {
        self.service = service
        self.movieID = movieID
    }
    
    func getMovieDetails(completion: @escaping (Result<MovieDetails?, NetworkError>) -> Void) {
        service.getMovieDetail(movieID: self.movieID) { response in
            switch response {
            case .success(let movieDetails):
                guaranteeMainThread {
                    completion(.success(movieDetails))
                }
            case .failure(let failure):
                guaranteeMainThread {
                    completion(.failure(failure))
                }
            }
        }
    }
    
    func getMovieID() -> Int {
        return self.movieID
    }
}
