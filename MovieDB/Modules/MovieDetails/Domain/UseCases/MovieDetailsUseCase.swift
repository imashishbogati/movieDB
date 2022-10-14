//
//  MovieDetailsUseCase.swift
//  MovieDB
//
//  Created by Ashish Bogati on 07/10/2022.
//

import Foundation

final class MovieDetailsUseCase: MovieDetailUseCaseInterface {
    
    private var worker: MovieListWokerProtocol
    
    init(worker: MovieListWokerProtocol = MovieWorker()) {
        self.worker = worker
    }
    
    private func createRequest(movieID: Int) -> URLRequest {
        let endPoint = MovieEndPoint(path: "movie/\(movieID)",
                                     page: "1")
        return worker.networkService.createRequest(url: endPoint.createEndPoint().url, method: .get)!
    }
    
    func getMovieDetails(movieID: Int,
                         completion: @escaping (Result<MovieDetails, NetworkError>) -> Void) {
        worker.getMovies(request: createRequest(movieID: movieID)) { response in
            switch response {
            case .success(let data):
                guard let data = data else {
                    completion(.failure(.noData))
                    return
                }
                let movieDetails = DecoderHelper.shared.decode(to: MovieDetails.self, data: data)!
                completion(.success(movieDetails))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
    
}
