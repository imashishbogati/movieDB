//
//  ListView.swift
//  MovieDB
//
//  Created by Ashish Bogati on 30/04/2022.
//

import UIKit

// MARK: - ListView

protocol MovieListViewDelegate: NSObject {
    func didFailed(error: NetworkError?)
    func didTapMovie(movieID: Int?)
}

class MovieListView: UIView {
    
    // MARK: - UI
    let headingLabel: UILabel = {
        let label = UILabel()
        label.text = "Popular"
        label.textColor = ColorCompatibility.label
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    let viewAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("View all", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.setTitleColor(ColorCompatibility.label, for: .normal)
        return button
    }()
    
    let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    weak var delegate: MovieListViewDelegate?
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.register(ListCollectionViewCell.self, forCellWithReuseIdentifier: ListCollectionViewCell.reuseIdentifier)
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    // MARK: - Ivars
    private var viewModel: MovieListViewModelProtocol?
    private var movieLists: MovieListResponse?
    private var listType: MovieListType = .popular

    // MARK: - Life Cycle
    required init(viewModel: MovieListViewModelProtocol, listType: MovieListType) {
        self.viewModel = viewModel
        self.listType = listType
        super.init(frame: .zero)
        setupViews()
        loadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        setupHierarchy()
        setupLayouts()
    }
    
    private func loadData() {
        headingLabel.text =  viewModel?.listTitle(list: listType)
        let request = MovieListRequest(page: "1")
        viewModel?.getMovies(request: request, completion: { [weak self] response in
            guard let self = self else {
                return
            }
            switch response {
            case .success(let movieList):
                self.movieLists = movieList
                self.collectionView.reloadData()
                self.delegate?.didFailed(error: nil)
            case .failure(let failure):
                self.delegate?.didFailed(error: failure)
            }
        })
    }

    
    private func setupHierarchy() {
        addSubview(headingLabel)
        addSubview(viewAllButton)
        addSubview(collectionView)
    }
    
    private func setupLayouts() {
        headingLabel.anchor(top: topAnchor,
                            leading: leadingAnchor,
                            bottom: nil,
                            trailing: trailingAnchor)
        
        viewAllButton.centerYTo(headingLabel.centerYAnchor)
        viewAllButton.anchor(top: nil,
                             leading: nil,
                             bottom: nil,
                             trailing: trailingAnchor)
        
        collectionView.anchor(top: headingLabel.bottomAnchor,
                              leading: leadingAnchor,
                              bottom: bottomAnchor,
                              trailing: trailingAnchor,
                              padding: .init(top: 10, left: 0, bottom: 0, right: 0))
    }
    
    // MARK: - Public
    func reloadList() {
        loadData()
    }
}

extension MovieListView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieLists?.results.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionViewCell.reuseIdentifier, for: indexPath) as? ListCollectionViewCell else {
            fatalError()
        }
        cell.loadData(model: movieLists, index: indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: self.collectionView.frame.width / 3, height: self.collectionView.frame.height)
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didTapMovie(movieID: movieLists?.results[indexPath.item].id)
    }
}
