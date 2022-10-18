//
//  NetworkService.swift
//  LittleIndia
//
//  Created by Ashish Bogati on 15/07/2022.
//

import Foundation.NSURLRequest

class NetworkServiceImplementation: NetworkService {

    private let dataLoader: NetworkLoader
    
    init(dataLoader: NetworkLoader) {
        self.dataLoader = dataLoader
    }
    
    func createURLRequest(requestURL: URL,
                          method: HTTPMethod,
                          headerType: HTTPHeaderType?,
                          headerValue: HTTPHeaderValue?) -> URLRequest {
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        
        if let headerType = headerType,
           let headerValue = headerValue {
            request.setValue(headerValue.rawValue, forHTTPHeaderField: headerType.rawValue)
        }
        return request
    }
    

    func loadData(using request: URLRequest,
                  with completion: @escaping (Result<Data, NetworkError>) -> Void) {
        dataLoader.loadData(using: request) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
            }
            
            if let response = response as? HTTPURLResponse {
                let statusCode = response.statusCode
                if statusCode != 200 {
                    completion(.failure(NetworkError(forRequestURL: request.url!,
                                                     errorMessage: error?.localizedDescription ?? "",
                                                     forStatusCode: statusCode)))
                }
                
                guard let data = data else {
                    completion(.failure(NetworkError(forRequestURL: request.url!,
                                                     errorMessage: "No data",
                                                     forStatusCode: statusCode)))
                    return
                }
                
                completion(.success(data))
            }
        }
    }
}
