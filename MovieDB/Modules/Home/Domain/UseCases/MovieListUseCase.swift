//
//  PopularMovieUseCase.swift
//  MovieDB
//
//  Created by Ashish Bogati on 05/10/2022.
//

import Foundation

// MARK: - MovieListUseCase

final class MovieListUseCase: MovieListUseCaseInterface {
    
    private var worker: MovieListWokerInterface
    private var page: String
    private var listType: String
    
    init(worker: MovieListWokerInterface = MovieWorker(),
         page: String,
         listType: MovieListType) {
        self.worker = worker
        self.page = page
        self.listType = listType.rawValue
    }
    
    private func createRequest() -> URLRequest {
        let endPoint = MovieEndPoint(path: listType, page: page)
        return worker.networkService.createRequest(url: endPoint.createEndPoint().url, method: .get)!
    }
    
    func getMovies(request: MovieListRequest,
                   completion: @escaping (Result<MovieListResponse, NetworkError>) -> Void) {
        worker.getMovies(request: createRequest()) { response in
            switch response {
            case .success(let data):
                guard let data = data else {
                    return
                }
                let trendingMovieList = DecoderHelper.shared.decode(to: MovieListResponse.self, data: data)!
                completion(.success(trendingMovieList))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
    
    
}
