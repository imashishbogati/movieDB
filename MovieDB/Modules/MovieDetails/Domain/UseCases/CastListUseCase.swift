//
//  CastListUseCase.swift
//  MovieDB
//
//  Created by Ashish Bogati on 08/10/2022.
//

import Foundation

// MARK: - CastListUseCase

final class CastListUseCase: MovieCastUseCaseInterface {
    
    private var worker: MovieListWokerInterface
    
    init(worker: MovieListWokerInterface = MovieWorker()) {
        self.worker = worker
    }
    
    private func createRequest(movieId: Int) -> URLRequest {
        let movieEndPoint = MovieEndPoint(path: "movie/\(movieId)/credits", page: "1")
        return worker.networkService.createRequest(url: movieEndPoint.createEndPoint().url, method: .get)!
    }
    
    
    func getMovieCast(movieID: Int,
                      completion: @escaping (Result<Person, NetworkError>) -> Void) {
        worker.getMovies(request: createRequest(movieId: movieID)) { response in
            switch response {
            case .success(let data):
                guard let data = data else {
                    completion(.failure(.noData))
                    return
                }
                let castList = DecoderHelper.shared.decode(to: Person.self, data: data)!
                completion(.success(castList))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}
