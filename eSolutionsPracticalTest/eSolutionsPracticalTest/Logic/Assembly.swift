//
//  Assembly.swift
//  eSolutionsPracticalTest
//
//  Created by Pavel N on 2022-09-03.
//

import Foundation
import UIKit

final class Assembly {
    private init() { }
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
    
    static func makeListOfProductsInteractor(dataManager: ShopApiManager,parentCategory:CategoryElement) -> ListOfProductsInteractor {
        ListOfProductsInteractor(dataManager: dataManager, parentCategory: parentCategory)
    }
    
    static func makeListOfProductsViewController(list:ListOfProducts,interactor:ListOfProductsInteractor) -> ListOfProductsViewController {
        let controller = storyboard.instantiateViewController(identifier: ListOfProductsViewController.describing()) { coder in
            return ListOfProductsViewController(coder: coder, list: list,interactor: interactor)
        }
        return controller
    }
    
    static func makeProductInfoViewController(productInfo: ProductItem) -> ProductInfoViewController {
        let controller = storyboard.instantiateViewController(identifier: ProductInfoViewController.describing()) { coder in
            ProductInfoViewController(coder: coder, productInfo: productInfo)
        }
        return controller
    }
}
