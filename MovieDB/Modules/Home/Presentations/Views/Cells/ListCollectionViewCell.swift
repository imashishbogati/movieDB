//
//  ListCollectionViewCell.swift
//  MovieDB
//
//  Created by Ashish Bogati on 05/10/2022.
//

import UIKit


class ListCollectionViewCell: ListBaseCollectionViewCell {
    
    // MARK: - UI
    let posterImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .clear
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Prodigal Son"
        label.numberOfLines = 1
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        contentView.layer.cornerRadius = 5
        contentView.clipsToBounds = true
        setupHierarchy()
        setupLayouts()
    }
    
    // MARK: - Private Methods
    private func setupHierarchy() {
        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
    }
    
    private func setupLayouts() {
        posterImageView.anchor(top: contentView.topAnchor,
                               leading: contentView.leadingAnchor,
                               bottom: nil,
                               trailing: contentView.trailingAnchor,
                               size: .init(width: 0, height: contentView.frame.height / 1.2))
        titleLabel.anchor(top: posterImageView.bottomAnchor,
                          leading: contentView.leadingAnchor,
                          bottom: nil,
                          trailing: contentView.trailingAnchor,
                          padding: .init(top: 5, left: 5, bottom: 0, right: 5))
    }
    
    // MARK: - Public Methods
    func loadData(model: MovieListResponse?, index: Int) {
        guard let model = model else {
            return
        }
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
