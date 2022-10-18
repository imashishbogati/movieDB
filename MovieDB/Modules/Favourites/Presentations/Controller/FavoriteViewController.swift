//
//  FavouritesViewController.swift
//  MovieDB
//
//  Created by Ashish Bogati on 07/10/2022.
//

import UIKit

class FavoriteViewController: UIViewController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
    }
    
    // MARK: - Private
    private func setupViews() {
        view.backgroundColor = ColorCompatibility.secondarySystemBackground
    }

}
