//
//  SearchResultControllerFactory.swift
//  MovieDB
//
//  Created by Ashish Bogati on 11/10/2022.
//

import UIKit

final class SearchResultControllerFactory {
    static func make(viewModel: MovieSearchViewModeProtocol) -> SearchResultViewController {
        let searchVC = SearchResultViewController()
        searchVC.viewModel = viewModel
        return searchVC
    }
}
