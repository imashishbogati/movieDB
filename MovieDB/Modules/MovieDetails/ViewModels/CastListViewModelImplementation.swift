//
//  CastListViewModel.swift
//  MovieDB
//
//  Created by Ashish Bogati on 08/10/2022.
//

import Foundation

class CastListViewModelImplementation: CastViewModel {
    
    private let service: CastService
    private let movieID: Int
    
    init(service: CastService, movieID: Int) {
        self.service = service
        self.movieID = movieID
    }
    
    func getMovieCast(completion: @escaping (Result<Person?, NetworkError>) -> Void) {
        service.getMovieCast(movieID: movieID) { response in
            switch response {
            case .success(let castList):
                guaranteeMainThread {
                    completion(.success(castList))
                }
            case .failure(let failure):
                guaranteeMainThread {
                    completion(.failure(failure))
                }
            }
        }
    }
    
}
