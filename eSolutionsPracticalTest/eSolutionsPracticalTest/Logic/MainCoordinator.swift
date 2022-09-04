//
//  Coordinator.swift
//  eSolutionsPracticalTest
//
//  Created by Pavel N on 2022-09-03.
//

import Foundation
import UIKit

final class MainCoordinator {
    private var navigationController:UINavigationController
    var baseViewController:UIViewController {
        get {
            return navigationController
        }
    }
    init() {
        self.navigationController = UINavigationController()
        showMainViewController()
    }
}

private extension MainCoordinator {
    func showMainViewController() {
        let apiManager = Assembly.makeShopApiManager(xApiKey: constants.xApiKey, baseUrl: constants.baseUrl)
        let interactor = Assembly.makeCategoriesInteractor(dataManager: apiManager)
        guard let controller = Assembly.makeCategoriesViewController(interactor: interactor) else {return}
        navigationController.pushViewController(controller, animated: true)
        controller.showListOfProducts = { [weak self] list,category in
            DispatchQueue.main.async {
                self?.showListOfProducts(list: list,category: category)
            }
        }
    }
    
    func showListOfProducts(list:ListOfProducts, category: CategoryElement) {
        let apiManager = Assembly.makeShopApiManager(xApiKey: constants.xApiKey, baseUrl: constants.baseUrl)
        let interactor = Assembly.makeListOfProductsInteractor(dataManager: apiManager, parentCategory: category)
        let controller = Assembly.makeListOfProductsViewController(list: list, interactor: interactor)
        controller.showProductInfo = {[weak self] product in
            DispatchQueue.main.async {
                self?.showProductInfoViewController(item: product)
            }
        }
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showProductInfoViewController(item:ProductItem) {
        let controller = Assembly.makeProductInfoViewController(productInfo: item)
        controller.backToCategories = { [weak self] in
            self?.navigationController.popToRootViewController(animated: true)
        }
        navigationController.pushViewController(controller, animated: true)
    }
}
