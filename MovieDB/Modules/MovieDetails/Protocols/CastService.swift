//
//  CastService.swift
//  MovieDB
//
//  Created by Ashish Bogati on 18/10/2022.
//

protocol CastService {
    func getMovieCast(movieID: Int,
                      completion: @escaping (Result<Person?, NetworkError>) -> Void)
}
