//
//  FavouriteFactory.swift
//  MovieDB
//
//  Created by Ashish Bogati on 07/10/2022.
//

import Foundation

// MARK: - FavouriteFactory

final class FavouriteFactory {
    static func make() -> FavouritesViewController {
        return FavouritesViewController()
    }
}
