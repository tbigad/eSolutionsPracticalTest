//
//  Assembly.swift
//  eSolutionsPracticalTest
//
//  Created by Pavel N on 2022-09-03.
//

import Foundation
import UIKit

final class Assembly {
    private init() {
        // All assemblies are static
    }
    private static let storyboard = UIStoryboard(name: "Main", bundle: nil)
    static func makeCategoriesViewController(interactor:CategoriesInteractor) -> CategoriesViewController? {
        let controller = storyboard.instantiateViewController(identifier: CategoriesViewController.describing()) { coder in
            return CategoriesViewController(coder: coder,interactor: interactor)
        }
        return controller
    }
    
    static func makeShopApiManager(xApiKey: String, baseUrl: URL) -> ShopApiManager {
        return ShopApiManager(xApiKey: xApiKey, baseUrl: baseUrl)
    }
    
    static func makeMainCoordinator() -> MainCoordinator {
        return MainCoordinator()
    }
    
    static func makeCategoriesInteractor(dataManager: ShopApiManager) -> CategoriesInteractor {
        CategoriesInteractor(dataManager: dataManager)
    }
}
