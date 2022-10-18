//
//  DecoderHelper.swift
//  LittleIndia
//
//  Created by Ashish Bogati on 15/07/2022.
//

import Foundation

class DecoderHelper {
    
    static let shared = DecoderHelper()
    
    private init() { }
    
    func decode<T: Decodable>(to type: T.Type, data: Data) -> T? {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(type, from: data)
        } catch {
            preconditionFailure("Error Decoding JSON into \(String(describing: type)) Object \(error)")
        }
    }
}
