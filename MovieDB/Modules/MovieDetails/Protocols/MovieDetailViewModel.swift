//
//  MovieDetailsViewModeProtocol.swift
//  MovieDB
//
//  Created by Ashish Bogati on 07/10/2022.
//

protocol MovieDetailViewModel {
    func getMovieDetails(completion: @escaping (Result<MovieDetails?, NetworkError>) -> Void)
    func getMovieID() -> Int
}
