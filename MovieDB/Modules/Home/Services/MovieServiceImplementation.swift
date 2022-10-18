//
//  MovieServiceImplementation.swift
//  MovieDB
//
//  Created by Ashish Bogati on 17/10/2022.
//

import Foundation

class MovieServiceImplementation: MovieService {
    
    private let networkService: NetworkService
    private let page: String
    private let listType: MovieListType
    
    init(networkService: NetworkService, page: String, listType: MovieListType) {
        self.networkService = networkService
        self.page = page
        self.listType = listType
    }
    
    private func createRequestURL() -> URLRequest {
        let endPoint = MovieEndPoint(path: listType.rawValue, page: self.page)
        return networkService.createURLRequest(requestURL: endPoint.createEndPoint().url,
                                               method: .get,
                                               headerType: nil,
                                               headerValue: nil)
    }
    
    func getMovies(completion: @escaping (Result<MovieListResponse?, NetworkError>) -> Void) {
        networkService.loadData(using: createRequestURL()) { response in
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
