//
//  CastServiceImplementation.swift
//  MovieDB
//
//  Created by Ashish Bogati on 18/10/2022.
//

import Foundation

class CastServiceImplementation: CastService {
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    private func createURLRequest(movieID: Int) -> URLRequest {
        let movieEndPoint = MovieEndPoint(path: "movie/\(movieID)/credits")
        return networkService.createURLRequest(requestURL: movieEndPoint.createEndPoint().url,
                                               method: .get,
                                               headerType: nil,
                                               headerValue: nil)
    }
    
    func getMovieCast(movieID: Int,
                      completion: @escaping (Result<Person?, NetworkError>) -> Void) {
        networkService.loadData(using: createURLRequest(movieID: movieID)) { response in
            switch response {
            case .success(let data):
                let castList = DecoderHelper.shared.decode(to: Person.self, data: data)
                completion(.success(castList))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
