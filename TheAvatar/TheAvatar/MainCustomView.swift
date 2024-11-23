//
//  MainCustomView.swift
//  TheAvatar
//
//  Created by Nikita Kuzmin on 24.11.2024.
//

import UIKit

final class MainContentView: UIView {
    private enum Constants {
        static let scrollViewHeight: CGFloat = 1000
    }
    
    // MARK: - Properties
    
    private(set) lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "person.crop.circle.fill")
        view.tintColor = .systemBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var logoImageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "Kit"))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: Constants.scrollViewHeight)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lyfecycle

    override func layoutSubviews() {
        super.layoutSubviews()
        logoImageView.layer.cornerRadius = logoImageView.frame.height / 2
        logoImageView.layer.masksToBounds = false
        logoImageView.clipsToBounds = true
    }
    
    // MARK: - Methods
    
    func setupProfileViewConstraints(superView: UIView) {
        NSLayoutConstraint.activate([
            imageView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -24),
            imageView.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -12),
            imageView.widthAnchor.constraint(equalToConstant: 36),
            imageView.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
}

// MARK: - Private

private extension MainContentView {
    func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(logoImageView)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leftAnchor.constraint(equalTo: leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            logoImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor, constant: -150),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
}
