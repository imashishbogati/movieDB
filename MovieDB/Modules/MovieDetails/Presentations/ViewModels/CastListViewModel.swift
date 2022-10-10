//
//  CastListViewModel.swift
//  MovieDB
//
//  Created by Ashish Bogati on 08/10/2022.
//

import Foundation

final class CastListViewModel: CastListViewModelInterface {
    
    private var useCase: MovieCastUseCaseInterface
    private var movieID: Int
    
    init(useCase: MovieCastUseCaseInterface = CastListUseCase(), movieID: Int) {
        self.useCase = useCase
        self.movieID = movieID
    }
    
    func getMovieCast(completion: @escaping (Result<Person, NetworkError>) -> Void) {
        useCase.getMovieCast(movieID: movieID) { response in
            switch response {
            case .success(let castList):
                guarenteeMainThread {
                    completion(.success(castList))
                }
            case .failure(let failure):
                guarenteeMainThread {
                    completion(.failure(failure))
                }
            }
        }
    }
    
}
