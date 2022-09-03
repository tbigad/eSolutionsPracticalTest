//
//  CategoriesInteractor.swift
//  eSolutionsPracticalTest
//
//  Created by Pavel N on 2022-09-03.
//

import Foundation

final class CategoriesInteractor {
    var reloadData:()->() = {fatalError("should reimplement")}
    private let dataSession:MainDataSession
    init(dataSession:MainDataSession) {
        self.dataSession = dataSession
    }
}
