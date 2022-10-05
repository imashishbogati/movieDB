//
//  AppConfiguration.swift
//  MovieDB
//
//  Created by Ashish Bogati on 05/10/2022.
//

import UIKit

final class AppConfigurations {
    static func setupRootViewController() -> UINavigationController {
        let homeVC = HomeFactory.make()
        let navigation = UINavigationController(rootViewController: homeVC)
        return navigation
    }
}
