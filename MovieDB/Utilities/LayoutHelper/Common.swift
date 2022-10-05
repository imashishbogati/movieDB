//
//  Common.swift
//
//  Created by Aashish Bogati on 5/20/20.
//  Copyright © 2020 Aashish Bogati. All rights reserved.
//

import Foundation
import UIKit

protocol CellConfigurer: AnyObject {
    static var nib: UINib {get}
    static var reuseIdentifier: String {get}
}

extension CellConfigurer {
    static var nib: UINib {
        return UINib(nibName: reuseIdentifier, bundle: nil)
    }
    static var reuseIdentifier: String{
        return String(describing: self)
    }
}

extension UICollectionViewCell: CellConfigurer {}
extension UITableViewCell: CellConfigurer {}

/*************************** UINIB<Extension> ************************************************/
extension UINib {
    class func nib(with name: String) -> UINib {
        return UINib(nibName: name, bundle: nil)
    }
}
