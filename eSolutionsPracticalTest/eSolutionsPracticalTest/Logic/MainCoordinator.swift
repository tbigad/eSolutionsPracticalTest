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
        controller.showListOfProducts = { [weak self] list in
            DispatchQueue.main.async {
                self?.showListOfProducts(list: list)
            }
        }
    }
    
    func showListOfProducts(list:ListOfProducts) {
        let controller = Assembly.makeListOfProductsViewController(list: list)
        navigationController.pushViewController(controller, animated: true)
    }
}
