//
//  ActivityIndicator.swift
//  MovieDB
//
//  Created by Ashish Bogati on 07/10/2022.
//

import UIKit

final class ActivityIndicator: UIView {
    
    static var shared = ActivityIndicator()
    
    lazy var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.style = .gray
        return indicator
    }()
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupViews() {
        backgroundColor = ColorCompatibility.secondarySystemBackground
    }
    
    // MARK: - Public
    func showIndicator(controller: UIViewController) {
        
        guard let view = controller.view else {
            return
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(self)
        addSubview(indicator)
        
        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            topAnchor.constraint(equalTo: view.topAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
        if !indicator.isAnimating {
            indicator.startAnimating()
        }
    }
    
    func hideIndicator() {
        guarenteeMainThread {
            if self.indicator.isAnimating {
                self.indicator.stopAnimating()
            }
            self.removeFromSuperview()
        }
        
    }
    
    
}
