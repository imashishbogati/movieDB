//
//  HomeViewController.swift
//  MovieDB
//
//  Created by Ashish Bogati on 05/10/2022.
//

import UIKit

// MARK: - HomeViewController

class HomeViewController: UIViewController {

    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private var searchController: UISearchController?
    
    lazy var popularMovieListView: MovieListView = {
        let view = MovieListView()
        view.viewModel = MovieListViewModel(useCase: MovieListUseCase(page: "1",
                                                                      listType: .popular))
        view.listType(listType: .popular)
        return view
    }()
    
    lazy var trendingMovieListView: MovieListView = {
        let view = MovieListView()
        view.viewModel = MovieListViewModel(useCase: MovieListUseCase(page: "1",
                                                                      listType: .trending))
        view.listType(listType: .trending)
        return view
    }()
    
    lazy var discoverMovieListView: MovieListView = {
        let view = MovieListView()
        view.viewModel = MovieListViewModel(useCase: MovieListUseCase(page: "1",
                                                                      listType: .nowPlaying))
        view.listType(listType: .nowPlaying)
        return view
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
        setupNavigationBar()
    }
    
    // MARK: - Private
    private func setupViews() {
        view.backgroundColor = ColorCompatibility.secondarySystemBackground
        setupScrollView()
        setupHierarchy()
        setupLayouts()
    }
    
    private func setupNavigationBar() {
        title = "Home"
        let searchButton = UIButton(frame: .init(x: 0, y: 0, width: 20, height: 20))
        setNavigationRightImageButton(buttons: [searchButton], imageName: "Search")
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let frameLayoutGuide = scrollView.frameLayoutGuide
        
        NSLayoutConstraint.activate([
            frameLayoutGuide.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            frameLayoutGuide.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            frameLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            frameLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        contentView.anchor(top: scrollView.topAnchor,
                           leading: scrollView.leadingAnchor,
                           bottom: scrollView.bottomAnchor,
                           trailing: scrollView.trailingAnchor)
        contentView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
    
    private func setupHierarchy() {
        scrollView.addSubview(popularMovieListView)
        scrollView.addSubview(trendingMovieListView)
        scrollView.addSubview(discoverMovieListView)
    }
    
    private func setupLayouts() {
        popularMovieListView.anchor(top: contentView.topAnchor,
                                    leading: contentView.leadingAnchor,
                                    bottom: nil,
                                    trailing: contentView.trailingAnchor,
                                    padding: .init(top: 0, left: 10, bottom: 0, right: 10),
                                    size: .init(width: 0, height: 250))
        
        
        trendingMovieListView.anchor(top: popularMovieListView.bottomAnchor,
                                     leading: contentView.leadingAnchor,
                                     bottom: nil,
                                     trailing: view.trailingAnchor,
                                     padding: .init(top: 20, left: 10, bottom: 0, right: 10),
                                     size: .init(width: 0, height: 250))
        
        discoverMovieListView.anchor(top: trendingMovieListView.bottomAnchor,
                                     leading: contentView.leadingAnchor,
                                     bottom: contentView.bottomAnchor,
                                     trailing: view.trailingAnchor,
                                     padding: .init(top: 20, left: 10, bottom: 0, right: 10),
                                     size: .init(width: 0, height: 250))
    }
    
}
