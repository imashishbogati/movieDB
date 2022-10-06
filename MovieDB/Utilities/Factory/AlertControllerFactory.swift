//
//  AlertControllerFactory.swift
//  MovieDB
//
//  Created by Ashish Bogati on 06/10/2022.
//

import UIKit

// MARK: - AlertControllerFactory

final class AlertControllerFactory {
    static func makeBasicAlert(title: String, message: String) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        return alertController
    }
}
