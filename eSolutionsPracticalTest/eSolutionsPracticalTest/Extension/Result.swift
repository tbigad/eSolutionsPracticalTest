//
//  Result.swift
//  eSolutionsPracticalTest
//
//  Created by Pavel N on 2022-09-03.
//

import Foundation

extension Result {
    func on(success: ((Success) -> Void)?, failure: ((Failure) -> Void)?) {
        if case let .success(value) = self {
            success?(value)
        }
        if case let .failure(value) = self {
            failure?(value)
        }
    }

    func onSuccess(_ action: ((Success) -> Void)?) {
        if case let .success(value) = self {
            action?(value)
        }
    }
    
    func onFailure(_ action: ((Failure) -> Void)?) {
        if case let .failure(value) = self {
            action?(value)
        }
    }
}
