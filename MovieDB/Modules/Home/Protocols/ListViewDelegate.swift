//
//  ListViewProtocol.swift
//  MovieDB
//
//  Created by Ashish Bogati on 06/10/2022.
//

import Foundation

protocol ListViewDelegate: NSObject {
    func didFailed(error: NetworkError)
}
