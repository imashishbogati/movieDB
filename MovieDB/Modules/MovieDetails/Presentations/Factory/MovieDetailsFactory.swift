//
//  MovieDetailsFactory.swift
//  MovieDB
//
//  Created by Ashish Bogati on 07/10/2022.
//

import Foundation

final class MovieDetailsFactory {
    static func make(viewModel: MovieDetailsViewModeProtocol) -> MovieDetailsViewController {
        let detailVC = MovieDetailsViewController()
        detailVC.viewModel = viewModel
        return detailVC
    }
}
