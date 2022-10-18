//
//  Constants.swift
//  MovieDB
//
//  Created by Ashish Bogati on 17/10/2022.
//

enum HTTPMethod: String {
    case get = "GET"
    case patch = "PATCH"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum HTTPHeaderType: String {
    case contentType = "Content-Type"
}

enum HTTPHeaderValue: String {
    case json = "application/json"
    case multipart = "multipart/form-data"
    case formData = "application/x-www-form-urlencoded charset=utf-8"
}
