//
//  MovieCastUseCaseInterface.swift
//  MovieDB
//
//  Created by Ashish Bogati on 10/10/2022.
//

import Foundation

// MARK: - MovieCastUseCaseInterface

protocol MovieCastUseCaseInterface {
    func getMovieCast(movieID: Int,
                         completion: @escaping (Result<Person, NetworkError>) -> Void)
}
