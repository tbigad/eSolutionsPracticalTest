//
//  Assembly.swift
//  eSolutionsPracticalTest
//
//  Created by Pavel N on 2022-09-03.
//

import Foundation
import UIKit

final class Assembly {
    private static let storyboard = UIStoryboard(name: "Main", bundle: nil)
    static func makeCategoriesViewController(interactor:CategoriesInteractor) -> CategoriesViewController? {
        let controller = storyboard.instantiateViewController(identifier: CategoriesViewController.describing()) { coder in
            return CategoriesViewController(coder: coder,interactor: interactor)
        }
        return controller
    }
    
    static func makeMainDataSession() -> MainDataSession {
        return MainDataSession()
    }
    
    static func makeMainCoordinator() -> MainCoordinator {
        let dataSession = MainDataSession()
        return MainCoordinator(dataSession: dataSession)
    }
    
    static func makeCategoriesInteractor(dataSession: MainDataSession) -> CategoriesInteractor {
        CategoriesInteractor(dataSession: dataSession)
    }
}
