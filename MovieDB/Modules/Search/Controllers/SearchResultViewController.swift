//
//  SearchResultViewController.swift
//  MovieDB
//
//  Created by Ashish Bogati on 11/10/2022.
//

import UIKit

protocol SearchResultViewDelegate: NSObject {
    func didTapSearchResult(movie_id: Int?)
}

class SearchResultViewController: UIViewController {

    lazy var resultTableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.register(SearchResultTableViewCell.self, forCellReuseIdentifier: SearchResultTableViewCell.reuseIdentifier)
        view.tableFooterView = UIView()
        return view
    }()
    
    private var movieList: MovieListResponse?
    weak var delegate: SearchResultViewDelegate?
    var viewModel: MovieSearchViewModel?
    let emptyView = EmptyView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
        loadData()
    }
    
    // MARK: - Private
    private func setupViews() {
        view.backgroundColor = ColorCompatibility.secondarySystemBackground
        setupResultTableView()
    }
    
    private func setupResultTableView() {
        view.addSubview(resultTableView)
        resultTableView.contentInsetAdjustmentBehavior = .never
        resultTableView.frame = view.frame
    }
    
    private func loadData() {
        viewModel?.getSearchResult(completion: { [weak self] response in
            guard let self = self else {
                return
            }
            switch response {
            case .success(let movieList):
                self.movieList = movieList
                self.resultTableView.isHidden = false
                self.resultTableView.reloadData()
                self.setupEmptyViewNoResultFound()
            case .failure(let error):
                self.resultTableView.isHidden = true
                self.emptyView.createEmptyView(title: error.localizedDescription,
                                           isRetryButtonHidden: true, viewController: self)
            }
        })
    }
    
    private func setupEmptyViewNoResultFound() {
        if movieList?.results.count == 0 {
            emptyView.createEmptyView(title: "No Result Found for  \(viewModel?.getQueryString() ?? "")",
                                       isRetryButtonHidden: true, viewController: self)
            resultTableView.isHidden = true
        } else {
            resultTableView.isHidden = false
        }
    }
}

extension SearchResultViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.reuseIdentifier) as? SearchResultTableViewCell else {
            fatalError()
        }
        guard let movieList = movieList else {
            return cell
        }
        cell.loadData(model: movieList, index: indexPath.item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let result = movieList?.results[indexPath.item]
        guard let result = result else {
            return
        }
        delegate?.didTapSearchResult(movie_id: result.id ?? nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
