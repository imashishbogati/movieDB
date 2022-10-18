//
//  EncoderHelper.swift
//  LittleIndia
//
//  Created by Ashish Bogati on 15/07/2022.
//

import Foundation

class EncoderHelper {
    static let shared = EncoderHelper()
    
    private init() { }
    
    func encode(from instance: [String: Any], request: URLRequest) -> URLRequest {
        var request = request
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: instance, options: [])
            request.httpBody = jsonData
            return request
        } catch {
            preconditionFailure("Failed to serialized json Data.")
        }
    }
    
    func encode<T: Encodable>(from instance: T, request: URLRequest) -> URLRequest {
        let jsonEncoder = JSONEncoder()
        var request = request
        do {
            request.httpBody = try jsonEncoder.encode(instance)
            return request
        } catch {
            preconditionFailure("Error encoding object into JSON \(error)")
        }
    }
    
    func getPostString(params: [String:Any]) -> String {
        var data = [String]()
        for(key, value) in params
        {
            data.append(key + "=\(value)")
        }
        return data.map { String($0) }.joined(separator: "&")
    }
    
    func encodeFormData(from params: [String: Any], request: URLRequest) -> URLRequest {
        var request = request
        let formData = getPostString(params: params)
        request.httpBody = formData.data(using: .utf8)
        return request
    }
}
