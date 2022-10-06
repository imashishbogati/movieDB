//
//  UIImageView+Extensions.swift
//  MovieDB
//
//  Created by Ashish Bogati on 06/10/2022.
//

import Foundation
import SDWebImage

extension UIImageView {
    func setImage(url: String?, completion: @escaping (Bool) -> ()) {
        let url = URL(string: "https://image.tmdb.org/t/p/w500/\(url ?? "")")
        self.sd_imageTransition = .fade
        self.sd_setImage(with: url) { image, error, cache, url in
            if error != nil {
                completion(false)
            } else {
                completion(true)
            }
        }
        completion(true)
    }
}
