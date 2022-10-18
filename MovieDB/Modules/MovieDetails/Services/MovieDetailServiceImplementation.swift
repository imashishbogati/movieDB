//
//  MovieDetailServiceImplementation.swift
//  MovieDB
//
//  Created by Ashish Bogati on 18/10/2022.
//

import Foundation

class MovieDetailServiceImplementation: MovieDetailService {
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    private func createURLRequest(movieID: Int) -> URLRequest {
        let endPoint = MovieEndPoint(path: "movie/\(movieID)")
        return networkService.createURLRequest(requestURL: endPoint.createEndPoint().url,
                                               method: .get,
                                               headerType: nil,
                                               headerValue: nil)
    }
    
    func getMovieDetail(movieID: Int,
                        completion: @escaping (Result<MovieDetails?, NetworkError>) -> Void) {
        networkService.loadData(using: createURLRequest(movieID: movieID)) { response in
            switch response {
            case .success(let data):
                let movieDetail = DecoderHelper.shared.decode(to: MovieDetails.self, data: data)
                completion(.success(movieDetail))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}
