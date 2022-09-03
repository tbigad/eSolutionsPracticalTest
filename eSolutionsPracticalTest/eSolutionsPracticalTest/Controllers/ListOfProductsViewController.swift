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
        let itemSize = NSCollectionLayoutSize( widthDimension: .fractionalWidth(1), heightDimension: .estimated(85))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize( widthDimension: .fractionalWidth(1), heightDimension: .estimated(85))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
extension ListOfProductsViewController : UICollectionViewDelegate {}
extension ListOfProductsViewController : UICollectionViewDataSource {}
