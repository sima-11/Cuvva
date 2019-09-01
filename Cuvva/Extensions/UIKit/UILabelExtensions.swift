import UIKit

extension UILabel {
    
    func style(color: UIColor, fontStyle: UIFont.FontStyle, numberOfLines: Int = 1, textAlignment: NSTextAlignment = .left) {
        
        self.textColor = color
        self.font = .style(fontStyle)
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
    }
}
