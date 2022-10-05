//
//  NetworkLoader.swift
//  LittleIndia
//
//  Created by Ashish Bogati on 15/07/2022.
//

import Foundation

protocol NetworkLoader {
    func loadData(using request: URLRequest,
                  with completion: @escaping (Data?, URLResponse?, NetworkError?) -> Void
    )
}
