//
//  CategoriesInteractor.swift
//  eSolutionsPracticalTest
//
//  Created by Pavel N on 2022-09-03.
//

import Foundation

final class CategoriesInteractor {
    var reloadData:()->() = {fatalError("should reimplement")}
    private let dataManager: ShopApiManager
    init(dataManager: ShopApiManager) {
        self.dataManager = dataManager
    }
    
    func getCategories(complition:@escaping (Result<Categories,Error>)->()) {
        dataManager.getCategories(complition: complition)
    }
}
