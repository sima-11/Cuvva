import UIKit

protocol Nibbable {
    static func nib(bundle: Bundle) -> UINib
}

extension Nibbable where Self: TypeIdentifiable {
    static func nib(bundle: Bundle = .main) -> UINib {
        return UINib(nibName: typeIdentifier, bundle: bundle)
    }
}
