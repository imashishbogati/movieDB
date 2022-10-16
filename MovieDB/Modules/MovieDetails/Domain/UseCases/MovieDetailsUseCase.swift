//
//  MovieDetailsUseCase.swift
//  MovieDB
//
//  Created by Ashish Bogati on 07/10/2022.
//

import Foundation

final class MovieDetailsUseCase: MovieDetailsUseCaseProtocol {
    
    private var movieService: MovieService
    
    init(service: MovieService) {
        self.movieService = service
    }
    
    //FIXME: Use URL request to create the request here
    private func createRequest(movieID: Int) -> URLRequest {
        let endPoint = MovieEndPoint(path: "movie/\(movieID)",
                                     page: "1")
        return movieService.createRequest(url: endPoint.createEndPoint().url, method: .get)!
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
