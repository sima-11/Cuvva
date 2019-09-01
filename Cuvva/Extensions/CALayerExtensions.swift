import UIKit

extension CALayer {
    
    enum ShadowOpacity: Float {
        case opacity100 = 1.0
        case opacity75 = 0.75
        case opacity50 = 0.5
        case opacity25 = 0.25
        case opacity10 = 0.1
        case opacity05 = 0.05
    }
    
    func applyShadow(color: UIColor, x: CGFloat, y: CGFloat, opacity: ShadowOpacity, blur: CGFloat, spread: CGFloat = 0.0) {
        
        shadowColor = color.cgColor
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        shadowOpacity = opacity.rawValue
        
        if spread == 0 {
            shadowPath = nil
        }
        else {
            let rect = bounds.insetBy(dx: -spread, dy: -spread)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
