//
//  NetworkError.swift
//  LittleIndia
//
//  Created by Ashish Bogati on 15/07/2022.
//

import Foundation

struct NetworkError: Error {
    let reason: String?
    let httpStatusCode: Int?
    let requestURL: URL?
    let requestBody: String?
    let serverResponse: String?
    
    init(withServerResponse response: Data? = nil, forRequestURL url: URL, withHttpBody body: Data? = nil, errorMessage message: String, forStatusCode statusCode: Int) {
        self.serverResponse = response != nil ? String(data: response!, encoding: .utf8) : nil
        self.requestURL = url
        self.requestBody = body != nil ? String(data: body!, encoding: .utf8) : nil
        self.httpStatusCode = statusCode
        self.reason = message
    }
}
