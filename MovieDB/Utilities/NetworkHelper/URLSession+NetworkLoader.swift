//
//  URLSession+NetworkLoader.swift
//  LittleIndia
//
//  Created by Ashish Bogati on 15/07/2022.
//

import Foundation

extension URLSession: NetworkLoader {
    func loadData(using request: URLRequest,
                  with completion: @escaping (Data?, URLResponse?, NetworkError?) -> Void) {
        dataTask(with: request) { data, response, error in
            if let _ = error {
                completion(nil, nil, .init(withServerResponse: data,
                                           forRequestURL: request.url!,
                                           errorMessage: error?.localizedDescription ?? "",
                                           forStatusCode: 200))
            }
            
            if let response = response as? HTTPURLResponse {
                let statusCode = response.statusCode
                if statusCode != 200 && statusCode < 300 {
                    completion(nil, nil, .init(forRequestURL: request.url!,
                                               errorMessage: error?.localizedDescription ?? "",
                                               forStatusCode: statusCode))
                }
            }
            
            completion(data, response as? HTTPURLResponse, nil)
            
        }.resume()
    }
}
