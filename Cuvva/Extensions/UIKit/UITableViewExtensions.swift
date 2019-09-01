import UIKit

extension UITableView {
    
    // MARK: Cell
    func register<T: UITableViewCell & Nibbable>(nibbableCell: T.Type) {
        register(nibbableCell.nib(), forCellReuseIdentifier: T.typeIdentifier)
    }
    
    func register<T: UITableViewCell>(cellClass: T.Type) {
        register(cellClass, forCellReuseIdentifier: T.typeIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>() -> T? {
        return dequeueReusableCell(withIdentifier: T.typeIdentifier) as? T
    }
    
    func register<T: UITableViewHeaderFooterView>(headerFooterViewClass: T.Type) {
        register(headerFooterViewClass, forHeaderFooterViewReuseIdentifier: T.typeIdentifier)
    }
    
    func dequeueHeaderFooterView<T: UITableViewHeaderFooterView>() -> T? {
        return dequeueReusableHeaderFooterView(withIdentifier: T.typeIdentifier) as? T
    }
}
