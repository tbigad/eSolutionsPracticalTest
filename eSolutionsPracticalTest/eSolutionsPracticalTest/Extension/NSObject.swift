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

extension Data {
    var prettyJson: String? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = String(data: data, encoding:.utf8) else { return nil }

        return prettyPrintedString
    }
}
