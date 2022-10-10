//
//  MovieDetailsViewModel.swift
//  MovieDB
//
//  Created by Ashish Bogati on 07/10/2022.
//

import Foundation

// MARK: - MovieDetailsViewModel

final class MovieDetailsViewModel: MovieDetailsViewModelInterface {
    
    private var useCase: MovieDetailUseCaseInterface
    private var movieID: Int
    
    init(movieID: Int, useCase: MovieDetailUseCaseInterface = MovieDetailsUseCase()) {
        self.useCase = useCase
        self.movieID = movieID
    }
    
    func getMovieDetails(completion: @escaping (Result<MovieDetails, NetworkError>) -> Void) {
        useCase.getMovieDetails(movieID: self.movieID) { response in
            switch response {
            case .success(let movieDetails):
                guarenteeMainThread {
                    completion(.success(movieDetails))
                }
                
            case .failure(let failure):
                guarenteeMainThread {
                    completion(.failure(failure))
                }
            }
        }
    }
    
    func getMovieID() -> Int {
        return self.movieID
    }
}
