//
//  CategoriesViewController.swift
//  eSolutionsPracticalTest
//
//  Created by Pavel N on 2022-09-03.
//

import UIKit

final class CategoriesViewController: UIViewController {
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    required init?(coder: NSCoder, interactor:CategoriesInteractor) {
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Categories"
        activityIndicator.stopAnimating()
    }

}

private extension CategoriesViewController {
}
