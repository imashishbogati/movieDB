//
//  MovieDetailsFactory.swift
//  MovieDB
//
//  Created by Ashish Bogati on 07/10/2022.
//

import Foundation

final class MovieDetailsFactory {
    static func make(movieID: Int) -> MovieDetailsViewController {
        let detailVC = MovieDetailsViewController()
        detailVC.movieID = movieID
        return detailVC
    }
}
