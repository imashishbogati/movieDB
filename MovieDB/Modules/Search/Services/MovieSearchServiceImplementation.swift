//
//  MovieSearchServiceImplementation.swift
//  MovieDB
//
//  Created by Ashish Bogati on 18/10/2022.
//

import Foundation

class MovieSearchServiceImplementation: MovieSearchService {
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    private func createURLRequest(query: String) -> URLRequest {
        let endPoint = MovieEndPoint(path: "search/movie",
                                     queryItems: [.init(name: "query", value: query)])
        return networkService.createURLRequest(requestURL: endPoint.createEndPoint().url,
                                               method: .get,
                                               headerType: nil,
                                               headerValue: nil)
    }
    
    func getSearchMovie(query: String,
                        completion: @escaping (Result<MovieListResponse?, NetworkError>) -> Void) {
        networkService.loadData(using: createURLRequest(query: query)) { response in
            switch response {
            case .success(let data):
                let movieList = DecoderHelper.shared.decode(to: MovieListResponse.self, data: data)
                completion(.success(movieList))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}
