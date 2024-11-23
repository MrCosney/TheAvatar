//
//  ViewController.swift
//  TheAvatar
//
//  Created by Nikita Kuzmin on 24.11.2024.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    private let customView = MainContentView()

    // MARK: - Initalization
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Sparrow"
    }
    
    // MARK: - Lifecycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard
            let typeView =  NSClassFromString("_UINavigationBarLargeTitleView"),
            let navBarView = navigationController?.navigationBar.subviews.first(where: { $0.isKind(of: typeView) })
        else { return }

        navBarView.addSubview(customView.imageView)
        customView.setupProfileViewConstraints(superView: navBarView)
    }

    override func viewWillDisappear(_ animated: Bool) {
        customView.imageView.removeFromSuperview()
    }
}
