//
//  MovieDetailsFactory.swift
//  MovieDB
//
//  Created by Ashish Bogati on 07/10/2022.
//

class MovieDetailsFactory {
    static func make(viewModel: MovieDetailViewModel) -> MovieDetailsViewController {
        let detailVC = MovieDetailsViewController()
        detailVC.viewModel = viewModel
        return detailVC
    }
}
