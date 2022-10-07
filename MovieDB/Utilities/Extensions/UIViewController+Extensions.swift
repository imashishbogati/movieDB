//
//  UIViewController+Extensions.swift
//  MovieDB
//
//  Created by Ashish Bogati on 05/10/2022.
//

import UIKit

extension UIViewController {
    func setNavigationRightImageButton(buttons: [UIButton], imageName: String...) {
        var customButtons: [UIBarButtonItem] = []
        for (index, button) in buttons.enumerated() {
            button.setImage(UIImage(named: imageName[index])?.withRenderingMode(.alwaysTemplate), for: .normal)
            button.tintColor = ColorCompatibility.label
            button.frame = .init(x: 0, y: 0, width: 20, height: 20)
            customButtons.append(UIBarButtonItem(customView: button))
        }
        
        let space = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        space.width = 16
        
        navigationItem.rightBarButtonItems = customButtons.reversed()
        
        if buttons.count > 1 {
            navigationItem.rightBarButtonItems?.insert(space, at: 1)
        }
    }
    
    func presentAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    func showActivityIndicator() {
        ActivityIndicator.shared.showIndicator(controller: self)
    }
    
    func hideActivityIndicator() {
        ActivityIndicator.shared.hideIndicator()
    }
}
