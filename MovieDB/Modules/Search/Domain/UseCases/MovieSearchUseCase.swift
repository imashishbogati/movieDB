//
//  MovieSearchUseCase.swift
//  MovieDB
//
//  Created by Ashish Bogati on 11/10/2022.
//

import Foundation

// MARK: - MovieSearchUseCase

final class MovieSearchUseCase: SearchUseCaseProtocol {
    
    private var worker: MovieService
    
    init(worker: MovieService = MovieServiceImplementation()) {
        self.worker = worker
    }
    
    private func createRequest(query: String) -> URLRequest {
        let endPoint = MovieEndPoint(path: "search/movie", page: "1", queryItems: [.init(name: "query", value: query)])
        return worker.networkService.createRequest(url: endPoint.createEndPoint().url, method: .get)!
    }
    
    func getSearchMovie(query: String,
                        completion: @escaping (Result<MovieListResponse, NetworkError>) -> Void) {
        worker.getMovies(request: createRequest(query: query)) { response in
            switch response {
            case .success(let data):
                guard let data = data else {
                    completion(.failure(.noData))
                    return
                }
                let searchResult = DecoderHelper.shared.decode(to: MovieListResponse.self, data: data)!
                completion(.success(searchResult))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}
