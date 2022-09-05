
import Foundation

extension NSObject {
    static func describing() -> String {
        return String(describing: Self.self)
    }
}
