//
//  MovieCastUseCaseProtocol.swift
//  MovieDB
//
//  Created by Ashish Bogati on 10/10/2022.
//

import Foundation

// MARK: - MovieCastUseCaseProtocol

protocol MovieCastUseCaseProtocol {
    func getMovieCast(movieID: Int,
                         completion: @escaping (Result<Person, NetworkError>) -> Void)
}
