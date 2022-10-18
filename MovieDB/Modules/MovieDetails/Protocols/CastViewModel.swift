//
//  CastViewModel.swift
//  MovieDB
//
//  Created by Ashish Bogati on 18/10/2022.
//

protocol CastViewModel {
    func getMovieCast(completion: @escaping (Result<Person?, NetworkError>) -> Void)
}
