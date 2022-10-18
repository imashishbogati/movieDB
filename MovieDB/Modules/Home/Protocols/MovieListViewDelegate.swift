//
//  MovieListViewDelegate.swift
//  MovieDB
//
//  Created by Ashish Bogati on 18/10/2022.
//

import Foundation

protocol MovieListViewDelegate: NSObject {
    func didFailed(error: NetworkError?)
    func didTapMovie(movieID: Int?)
}
