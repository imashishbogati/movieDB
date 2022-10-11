//
//  HomeViewController.swift
//  MovieDB
//
//  Created by Ashish Bogati on 05/10/2022.
//

import UIKit

// MARK: - HomeViewController

class HomeViewController: UIViewController {

    let scrollView = UIScrollView()
    let contentView = UIView()
    var searchController: UISearchController?
    
    lazy var popularMovieListView: MovieListView = {
        let vm = MovieListViewModel(useCase: MovieListUseCase(page: "1",
                                                              listType: .popular))
        let view = MovieListView(viewModel: vm,
                                 listType: .popular)
        view.delegate = self
        return view
    }()
    
    lazy var trendingMovieListView: MovieListView = {
        let viewModel = MovieListViewModel(useCase: MovieListUseCase(page: "1",
                                                                      listType: .trending))
        let view = MovieListView(viewModel: viewModel,
                                 listType: .trending)
       
        view.delegate = self
        return view
    }()
    
    lazy var discoverMovieListView: MovieListView = {
        let viewModel = MovieListViewModel(useCase: MovieListUseCase(page: "1",
                                                                      listType: .nowPlaying))
        let view = MovieListView(viewModel: viewModel,
                                 listType: .nowPlaying)
        view.delegate = self
        return view
    }()
    
    lazy var emptyView = EmptyView()
    
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
        configureEmptyView()
        showActivityIndicator()
    }
    
    private func setupNavigationBar() {
        title = "Home"
        let searchButton = UIButton(frame: .init(x: 0, y: 0, width: 20, height: 20))
        setNavigationRightImageButton(buttons: [searchButton], imageName: "Search")
    }
    
    private func configureEmptyView() {
        emptyView.retryButton.addTarget(self, action: #selector(didTapRetryButton), for: .touchUpInside)
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
    
    
    // MARK: - Action
    @objc
    func didTapRetryButton() {
        showActivityIndicator()
        emptyView.removeFromSuperview()
        trendingMovieListView.reloadList()
        popularMovieListView.reloadList()
        discoverMovieListView.reloadList()
    }
    
}


extension HomeViewController: MovieListViewDelegate {
    func didFailed(error: NetworkError?) {
        if error != nil {
            hideActivityIndicator()
            scrollView.isHidden = true
            emptyView.createEmptyView(title: "Something went wrong.", isRetryButtonHidden: true, viewController: self)
        } else {
            hideActivityIndicator()
            emptyView.removeFromSuperview()
            scrollView.isHidden = false
        }
    }
    
    func didTapMovie(movieID: Int?) {
        if let movieID = movieID{
            let movieDetailsVM = MovieDetailsViewModel(movieID: movieID)
            let movieDetailsVC = MovieDetailsFactory.make(viewModel: movieDetailsVM)
            show(movieDetailsVC, sender: self)
        }
    }
}
