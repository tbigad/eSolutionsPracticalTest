//
//  NSObject.swift
//  HeartRateMonitor
//
//  Created by Pavel Nadolski on 15.12.2021.
//  Copyright © 2021 AIBY. All rights reserved.
//

import Foundation

extension NSObject {
    static func describing() -> String {
        return String(describing: Self.self)
    }
}
