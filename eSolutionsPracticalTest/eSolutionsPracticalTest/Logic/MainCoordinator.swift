//
//  Coordinator.swift
//  eSolutionsPracticalTest
//
//  Created by Pavel N on 2022-09-03.
//

import Foundation
import UIKit

final class MainCoordinator {
    private let dataSession:MainDataSession
    private var navigationController:UINavigationController
    var baseViewController:UIViewController {
        get {
            return navigationController
        }
    }
    init(dataSession:MainDataSession) {
        self.navigationController = UINavigationController()
        self.dataSession = dataSession
        showMainViewController()
    }
}

private extension MainCoordinator {
    func showMainViewController() {
        let interactor = Assembly.makeCategoriesInteractor(dataSession: self.dataSession)
        guard let controller = Assembly.makeCategoriesViewController(interactor: interactor) else {return}
        navigationController.pushViewController(controller, animated: true)
    }
}
