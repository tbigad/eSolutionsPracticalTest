//
//  ListOfProductsInteractor.swift
//  eSolutionsPracticalTest
//
//  Created by Pavel N on 2022-09-04.
//

import Foundation

final class ListOfProductsInteractor {
    private let dataManager: ShopApiManager
    private let parentCategory:CategoryElement
    init(dataManager: ShopApiManager,parentCategory: CategoryElement) {
        self.parentCategory = parentCategory
        self.dataManager = dataManager
    }
    
    func getProducts(page:Int,complition:@escaping (Result<ListOfProductsOutput,Error>) -> Void) {
        dataManager.getListOfProducts(category: parentCategory.url, page: page, complition:complition)
    }
    
    func getProductInfo(productUrl:String, complition:@escaping (Result<ProductItem,Error>) -> Void) {
        dataManager.getProductInfo(productIdentifier: productUrl, complition: complition)
    }
}
