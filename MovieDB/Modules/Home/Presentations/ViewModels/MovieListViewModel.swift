//
//  MovieListViewModel.swift
//  MovieDB
//
//  Created by Ashish Bogati on 05/10/2022.
//

import Foundation

// MARK: - MovieListViewModel

final class MovieListViewModel: MovieListViewModelInterface {
    func listTitle(list: ListType) -> String {
        switch list {
        case .popular:
            return "Popular"
        case .trending:
            return "Trending"
        }
    }
    
    
}
