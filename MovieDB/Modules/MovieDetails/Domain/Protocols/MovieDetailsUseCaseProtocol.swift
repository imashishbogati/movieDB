//
//  MovieDetailsUseCaseProtocol.swift
//  MovieDB
//
//  Created by Ashish Bogati on 07/10/2022.
//

import Foundation

protocol MovieDetailsUseCaseProtocol {
    func getMovieDetails(movieID: Int,
                         completion: @escaping (Result<MovieDetails, NetworkError>) -> Void)
}
