//
//  ProductInfoViewController.swift
//  eSolutionsPracticalTest
//
//  Created by Pavel N on 2022-09-03.
//

import WebKit

final class ProductInfoViewController: UIViewController {
    var backToList:() -> Void = {fatalError("should be implement")}
    var backToCategories:() -> Void = {fatalError("should be implement")}
    private let productInfo:ProductItem
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var webView: WKWebView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var webViewHeghtConstraint: NSLayoutConstraint!
    private var homeButton:UIBarButtonItem?
    
    required init?(coder: NSCoder,productInfo:ProductItem) {
        self.productInfo = productInfo
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Product info"
        priceLabel.text = String(format: "%.02f$", productInfo.price)
        titleLabel.text = productInfo.title
        webView.loadHTMLString(productInfo.description, baseURL: nil)
        webView.scrollView.isScrollEnabled = false
        let urlString = "http://images1.opticsplanet.com/365-240-ffffff/\(productInfo.image).jpg"
        if let url = URL(string: urlString) {
            imageView.load(url: url, placeholder: UIImage(named: "placeholder"))
        }
        homeButton = UIBarButtonItem(image: UIImage(systemName: "house.circle.fill"), style: .plain, target: self, action: #selector(self.didTapGoToHome))
        navigationItem.setRightBarButton(homeButton, animated: false)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}

@objc extension ProductInfoViewController {
    func didTapGoToHome() {
        self.backToCategories()
    }
}
