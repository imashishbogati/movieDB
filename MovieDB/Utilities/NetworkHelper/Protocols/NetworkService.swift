//
//  NetworkService.swift
//  MovieDB
//
//  Created by Ashish Bogati on 17/10/2022.
//

import Foundation.NSURLRequest

protocol NetworkService {
    func createURLRequest(requestURL: URL,
                       method: HTTPMethod,
                       headerType: HTTPHeaderType?,
                       headerValue: HTTPHeaderValue?) -> URLRequest
    func loadData(using request: URLRequest,
                  with completion: @escaping (Result<Data, NetworkError>) -> Void)
}
