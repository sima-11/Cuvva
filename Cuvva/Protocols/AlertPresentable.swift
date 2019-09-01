import UIKit

protocol AlertPresentable {
    
    func presentAlertController(title: String?, message: String?, style: UIAlertController.Style, actions: [UIAlertAction], completion: (() -> Void)?)
}

extension AlertPresentable where Self: UIViewController {
    
    func presentAlertController(title: String?, message: String?, style: UIAlertController.Style, actions: [UIAlertAction], completion: (() -> Void)?) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        for action in actions {
            alertController.addAction(action)
        }
        self.present(alertController, animated: true, completion: completion)
    }
    
    func presentSimpleAlert(title: String?, message: String?, actionTitle: String?) {
        let action = UIAlertAction(title: actionTitle, style: .default, handler: nil)
        self.presentAlertController(title: title, message: message, style: .alert, actions: [action], completion: nil)
    }
}
