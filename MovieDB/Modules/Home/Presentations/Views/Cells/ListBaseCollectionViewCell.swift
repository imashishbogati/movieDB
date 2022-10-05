//
//  ListBaseCollectionViewCell.swift
//  MovieDB
//
//  Created by Ashish Bogati on 05/10/2022.
//

import UIKit

// MARK: - ListBaseCollectionViewCell

class ListBaseCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    public func setupViews() {
        
    }
    
}
