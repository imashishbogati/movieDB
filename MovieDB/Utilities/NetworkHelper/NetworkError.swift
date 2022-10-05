//
//  NetworkError.swift
//  LittleIndia
//
//  Created by Ashish Bogati on 15/07/2022.
//

import Foundation


enum NetworkError: Error {
    
    public enum RequestError {
        case invalidRequest(URLRequest)
        case encodingError(EncodingError)
        case other(Error)
    }
    
    public enum ServerError {
        case decodingError(DecodingError)
        case noInternetConnection
        case timeout
        case internalServerError
        case other(statusCode: Int, response: HTTPURLResponse)
    }
    
    case noData
    case requestError(RequestError)
    case serverError(ServerError)
}
