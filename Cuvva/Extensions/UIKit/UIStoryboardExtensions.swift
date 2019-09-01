import UIKit

extension UIStoryboard {
    
    enum Name: String {
        case home = "Home"
        case policies = "Policies"
        case receipts = "Receipts"
    }
    
    convenience init(name: Name, bundle: Bundle? = nil) {
        self.init(name: name.rawValue, bundle: bundle)
    }
    
    func viewController<T: UIViewController>() -> T? {
        let viewController = instantiateViewController(withIdentifier: T.typeIdentifier)
        return viewController as? T
    }
}
