//
//  MovieDetailService.swift
//  MovieDB
//
//  Created by Ashish Bogati on 18/10/2022.
//

protocol MovieDetailService {
    func getMovieDetail(movieID: Int,
                        completion: @escaping (Result<MovieDetails?, NetworkError>) -> Void)
}
