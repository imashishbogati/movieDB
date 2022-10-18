//
//  FavouriteFactory.swift
//  MovieDB
//
//  Created by Ashish Bogati on 07/10/2022.
//

import Foundation

// MARK: - FavouriteFactory

final class FavoriteFactory {
    static func make() -> FavoriteViewController {
        return FavoriteViewController()
    }
}
