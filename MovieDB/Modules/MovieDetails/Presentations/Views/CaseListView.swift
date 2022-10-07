//
//  CastCollectionView.swift
//  MovieDB
//
//  Created by Ashish Bogati on 28/10/2021.
//

import UIKit

class CaseListView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
    let headingLabel: UILabel = {
        let label = UILabel()
        label.text = "Popular"
        label.textColor = ColorCompatibility.label
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = .init(top: 0, left: 5, bottom: 0, right: 5)
        layout.minimumLineSpacing = 15
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.showsVerticalScrollIndicator = false
        view.register(CastCollectionViewCell.self, forCellWithReuseIdentifier: CastCollectionViewCell.reuseIdentifier)
        view.showsHorizontalScrollIndicator = false
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    // MARK: - inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Functions
    private func setupViews() {
        self.setupHiearchy()
        self.setupLayout()
        
    }
    
    private func setupHiearchy() {
        self.addSubview(headingLabel)
        self.addSubview(collectionView)
    }
    
    private func setupLayout() {
        self.headingLabel.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: nil)
        
        self.collectionView.anchor(top: self.headingLabel.bottomAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0))
    }
    
    public func reloadData() {
        collectionView.reloadData()
    }
    
    // MARK: - Delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CastCollectionViewCell.reuseIdentifier, for: indexPath) as? CastCollectionViewCell else { fatalError() }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: self.collectionView.frame.width / 4, height: self.collectionView.frame.height)
    }
    

}