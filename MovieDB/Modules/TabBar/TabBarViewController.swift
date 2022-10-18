//
//  TabBarViewController.swift
//  MovieDB
//
//  Created by Ashish Bogati on 07/10/2022.
//

import UIKit

// MARK: - TabBarViewController

class TabBarViewController: UITabBarController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
    }
    
    private func setupViews() {
        viewControllers = [
            createNavigationBar(controller: HomeFactory.make(), title: "Home", imageName: "house.fill"),
            createNavigationBar(controller: FavoriteFactory.make(), title: "Favorite", imageName: "star.fill")
        ]
    }
    
    
    private func createNavigationBar(controller: UIViewController,
                                     title: String,
                                     imageName: String) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
        return navigationController
    }

}
