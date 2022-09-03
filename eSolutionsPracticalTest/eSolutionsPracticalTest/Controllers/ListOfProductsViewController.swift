//
//  ListOfProductsViewController.swift
//  eSolutionsPracticalTest
//
//  Created by Pavel N on 2022-09-03.
//

import UIKit

final class ListOfProductsViewController: UIViewController {
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var collectionView: UICollectionView!
    private var viewModel:ListOfProducts
    
    required init?(coder: NSCoder,data:ListOfProducts) {
        self.viewModel = data
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "List of Products"
        activityIndicator.stopAnimating()
        activityIndicator.hidesWhenStopped = true
        collectionView.collectionViewLayout = createBasicListLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 8, left: .zero, bottom: view.safeAreaInsets.bottom, right: .zero)
    }
}
private extension ListOfProductsViewController {
    func createBasicListLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize( widthDimension: .fractionalWidth(1), heightDimension: .estimated(95))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize( widthDimension: .fractionalWidth(1), heightDimension: .estimated(95))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
extension ListOfProductsViewController : UICollectionViewDelegate {}
extension ListOfProductsViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListOfItemCollectionViewCell.describing(), for: indexPath) as? ListOfItemCollectionViewCell else { return UICollectionViewCell() }
        
        let item = viewModel[indexPath.item]
        let urlString = "http://images1.opticsplanet.com/120-90-ffffff/\(item.primaryImage).jpg"
        let url = URL(string: urlString)
        cell.setupCell(title: item.shortName, price: item.price, imageUrl: url)
        return cell
    }
}
