//
//  EmptyView.swift
//  MovieDB
//
//  Created by Ashish Bogati on 07/10/2022.
//

import UIKit

final class EmptyView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = title ?? ""
        label.textAlignment = .center
        label.textColor = ColorCompatibility.label
        return label
    }()
    
    lazy var retryButton: UIButton = {
        let button = UIButton()
        button.setTitle("Retry", for: .normal)
        button.layer.cornerRadius = 5
        button.isHidden = isRetryButtonHidden ?? false
        button.setTitleColor(ColorCompatibility.link, for: .normal)
        return button
    }()
    
    
    private var title: String?
    private var isRetryButtonHidden: Bool?
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(titleLabel)
        addSubview(retryButton)
        setupLayouts()
    }
    
    private func setupLayouts() {
        titleLabel.centerXTo(centerXAnchor)
        titleLabel.centerYTo(centerYAnchor)
        titleLabel.anchor(top: nil,
                          leading: leadingAnchor,
                          bottom: nil,
                          trailing: trailingAnchor,
                          padding: .init(top: 0, left: 10, bottom: 0, right: 10))
        
        retryButton.centerXTo(centerXAnchor)
        retryButton.anchor(top: titleLabel.bottomAnchor,
                           leading: nil,
                           bottom: nil,
                           trailing: nil,
                           size: .init(width: 100, height: 30))
    }
    
    
    func createEmptyView(title: String, isRetryButtonHidden: Bool, viewController: UIViewController) {
        self.titleLabel.text = title
        self.isRetryButtonHidden = isRetryButtonHidden
        
        guard let view = viewController.view else {
            return
        }
        view.addSubview(self)
        anchor(top: view.topAnchor,
               leading: view.leadingAnchor,
               bottom: view.bottomAnchor,
               trailing: view.trailingAnchor)
    }
}
