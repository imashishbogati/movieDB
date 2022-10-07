//
//  DetailViewController.swift
//  MovieDB
//
//  Created by Ashish Bogati on 27/10/2021.
//

import UIKit

public extension CGFloat {
    static let marginTop: CGFloat = 20
    static let marginLeft: CGFloat = 20
    static let marginRight: CGFloat = 20
    static let marginBottom: CGFloat = 20
    static let defaultCornerRadius: CGFloat = 6
}


class MovieDetailsViewController: UIViewController {

    // MARK: - IVars
    lazy var guide = self.view.safeAreaLayoutGuide
    let scrollView = UIScrollView()
    let contentView = UIView()

    var viewModel: MovieDetailsViewModelInterface?
    
    let posterImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let overviewLabel: UILabel = {
        let label = UILabel()
        label.text = "Overview"
        label.textColor = ColorCompatibility.label
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    let overViewDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = ColorCompatibility.label
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        label.isUserInteractionEnabled = true
        label.sizeToFit()
        return label
    }()
    
    lazy var castListView: CaseListView = {
        let view = CaseListView()
        view.headingLabel.text = "Top Billed Cast"
        return view
    }()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupViews()
        self.loadData()
    }
    
    
    // MARK: - Private
    private func setupViews() {
        view.backgroundColor = ColorCompatibility.secondarySystemBackground
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        setupHiearchy()
        setupLayout()
        loadData()
    }
    
    private func loadData() {
        showActivityIndicator()
        viewModel?.getMovieDetails(completion: { [weak self] response in
            guard let self = self else {
                return
            }
            self.hideActivityIndicator()
            switch response {
            case .success(let details):
                self.setMovieDetailsData(movieDetails: details)
            case .failure(let error):
                self.scrollView.isHidden = true
                let emptyView = EmptyView()
                emptyView.createEmptyView(title: error.localizedDescription, isRetryButtonHidden: true, viewController: self)
            }
        })
    }
    
    private func setMovieDetailsData(movieDetails: MovieDetails?) {
        title = movieDetails?.original_title ?? ""
        posterImageView.setImage(url: movieDetails?.backdrop_path ?? "") { [weak self] status in
            if status == false {
                self?.posterImageView.image = UIImage(named: "empty-profile")
            }
        }
        overViewDescriptionLabel.text = movieDetails?.overview ?? ""
    }

    private func setupHiearchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(posterImageView)
        contentView.addSubview(overviewLabel)
        contentView.addSubview(overViewDescriptionLabel)
        contentView.addSubview(castListView)
    }
    
    private func setupLayout() {
        scrollView.centerXTo(view.centerXAnchor)
        scrollView.anchor(top: self.guide.topAnchor, leading: self.guide.leadingAnchor, bottom: self.guide.bottomAnchor, trailing: self.guide.trailingAnchor)
        
        contentView.centerXTo(scrollView.centerXAnchor)
        contentView.anchor(top: scrollView.topAnchor, leading: scrollView.leadingAnchor, bottom: scrollView.bottomAnchor, trailing: scrollView.trailingAnchor, padding: .init(top: 0, left: .marginLeft, bottom: 0, right: .marginRight))
        
        posterImageView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: .init(top: 0, left: -20, bottom: 0, right: -20), size: .init(width: 0, height: 240))
        
        overviewLabel.anchor(top: posterImageView.bottomAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: .init(top: .marginTop, left: 0, bottom: 0, right: 0))
        
        overViewDescriptionLabel.anchor(top: overviewLabel.bottomAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: .init(top: .marginTop - 10, left: 0, bottom: 0, right: 0))
        
        castListView.anchor(top: overViewDescriptionLabel.bottomAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: .init(top: .marginTop, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 200))
        
    }
    
    // MARK: - Action
    @objc
    func labelAction(gesture: UITapGestureRecognizer)
    {
        if overViewDescriptionLabel.numberOfLines == 0 {
            overViewDescriptionLabel.numberOfLines = 3
        } else {
            overViewDescriptionLabel.numberOfLines = 0
        }
    }

}
