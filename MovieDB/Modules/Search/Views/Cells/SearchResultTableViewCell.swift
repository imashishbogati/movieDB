//
//  SearchResultTableViewCell.swift
//  MovieDB
//
//  Created by Ashish Bogati on 11/10/2022.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {

    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorCompatibility.secondarySystemBackground
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorCompatibility.label
        return label
    }()
    
    private let posterImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = ColorCompatibility.secondaryLabel
        view.layer.cornerRadius = 4
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        setupViews()
    }
    
    // MARK: - Private
    private func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(posterImageView)
        
        containerView.fillSuperview()
        
        posterImageView.centerYTo(containerView.centerYAnchor)
        posterImageView.anchor(top: nil,
                          leading: containerView.leadingAnchor,
                          bottom: nil,
                          trailing: nil,
                          padding: .init(top: 0, left: 10, bottom: 0, right: 0),
                          size: .init(width: 40, height: 40))
        titleLabel.centerYTo(containerView.centerYAnchor)
        titleLabel.anchor(top: nil,
                          leading: posterImageView.trailingAnchor,
                          bottom: nil,
                          trailing: containerView.trailingAnchor,
                          padding: .init(top: 0, left: 10, bottom: 0, right: 0))
    }
    
    // MARK: - Public
    func loadData(model: MovieListResponse, index: Int) {
        let result = model.results[index]
        if !model.results.isEmpty {
            titleLabel.text = result.original_title ?? ""
            posterImageView.setImage(url: result.poster_path ?? "") { [weak self] status in
                if status == false {
                    self?.posterImageView.image = UIImage(named: "empty-profile")
                }
                
            }
        }
    }

}
