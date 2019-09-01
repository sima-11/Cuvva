import Foundation

protocol TypeIdentifiable {
    static var typeIdentifier: String { get }
}

extension TypeIdentifiable {
    static var typeIdentifier: String {
        return String(describing: self)
    }
}
