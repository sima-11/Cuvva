import UIKit

extension UIViewController: TypeIdentifiable {}

extension UIViewController {
    
    func embeddedInNavigationController() -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: self)
        navigationController.navigationBar.isTranslucent = false
        return navigationController
    }
}
