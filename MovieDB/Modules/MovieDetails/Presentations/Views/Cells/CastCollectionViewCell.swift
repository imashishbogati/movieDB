//
//  CastCollectionViewCell.swift
//  MovieDB
//
//  Created by Ashish Bogati on 27/10/2021.
//

import UIKit
import SDWebImage

class CastCollectionViewCell: UICollectionViewCell {
    
    // MARk: - Ivars
    let castImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = ColorCompatibility.label
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    private func setupViews() {
        setupHierachy()
        setupLayout()
        self.castImageView.layer.cornerRadius = 50
        self.castImageView.clipsToBounds = true
    }
    
    
    private func setupHierachy() {
        contentView.addSubview(castImageView)
        contentView.addSubview(titleLabel)
    }
    
    private func setupLayout() {
        castImageView.centerXTo(contentView.centerXAnchor)
        castImageView.anchor(top: contentView.topAnchor, leading: nil, bottom: nil, trailing: nil, size: .init(width: 100, height: 100))
        titleLabel.anchor(top: castImageView.bottomAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: .init(top: 5, left: 5, bottom: 0, right: 5))
        
    }
    
}
