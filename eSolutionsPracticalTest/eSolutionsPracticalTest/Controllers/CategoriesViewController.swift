//
//  CategoriesViewController.swift
//  eSolutionsPracticalTest
//
//  Created by Pavel N on 2022-09-03.
//

import UIKit

final class CategoriesViewController: UIViewController {
    var showListOfProducts:(ListOfProducts)->() = {_ in fatalError("should implement")}
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var collectionView: UICollectionView!
    private var viewModel = Categories()
    private var interactor:CategoriesInteractor
    required init?(coder: NSCoder, interactor:CategoriesInteractor) {
        self.interactor = interactor
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Categories"
        activityIndicator.stopAnimating()
        activityIndicator.hidesWhenStopped = true
        collectionView.collectionViewLayout = createBasicListLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 8, left: .zero, bottom: view.safeAreaInsets.bottom, right: .zero)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadCategories()
    }
    
}

extension CategoriesViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        defer {
            collectionView.deselectItem(at: indexPath, animated: true)
        }
        activityIndicator.startAnimating()
        let item = viewModel[indexPath.item]
        interactor.getProducts(categoryElement: item) {[weak self] result in
            DispatchQueue.main.async {
                self?.activityIndicator.startAnimating()
            }
            result.on { list in
                self?.showListOfProducts(list.gridProducts.elements)
            } failure: { error in
                print(error)
            }

        }
    }
}
extension CategoriesViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.describing(), for: indexPath) as? CategoriesCollectionViewCell else { return UICollectionViewCell() }
        
        let item = viewModel[indexPath.item]
        cell.setupCell(title: item.shortName, subtitle: item.fullName)
        return cell
    }
}

private extension CategoriesViewController {
    func reloadCategories() {
        activityIndicator.startAnimating()
        interactor.getCategories {[weak self] result in
            DispatchQueue.main.async {
                self?.activityIndicator.stopAnimating()
            }
            result.on { categories in
                self?.viewModel = categories
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            } failure: { error in
                print(error.localizedDescription)
            }
            
        }
    }
    
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
