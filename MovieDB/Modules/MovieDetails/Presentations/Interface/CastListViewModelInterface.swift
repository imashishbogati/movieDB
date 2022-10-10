//
//  CastListViewModelInterface.swift
//  MovieDB
//
//  Created by Ashish Bogati on 08/10/2022.
//

import Foundation

protocol CastListViewModelInterface {
    func getMovieCast(completion: @escaping (Result<Person, NetworkError>) -> Void)
}
