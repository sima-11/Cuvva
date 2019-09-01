import UIKit

extension UIFont {
    
    enum FontName: String {
        case sanFrancisco = "SFUIDisplay"
    }
    
    enum FontWeight: String {
        case bold = "Bold"
        case semiBold = "SemiBold"
        case regular = "Regular"
        case medium = "Medium"
        case light = "Light"
    }
    
    enum FontStyle {
        case h1
        case h2
        case h3
        case body
        case bodyBold
        case paragraph
        case label
        
        var value: UIFont {
            switch self {
            case .h1:
                return UIFont(fontName: .sanFrancisco, weight: .bold, size: 25.0)
            case .h2:
                return UIFont(fontName: .sanFrancisco, weight: .bold, size: 20.0)
            case .h3:
                return UIFont(fontName: .sanFrancisco, weight: .bold, size: 18.0)
            case .body:
                return UIFont(fontName: .sanFrancisco, weight: .regular, size: 16.0)
            case .bodyBold:
                return UIFont(fontName: .sanFrancisco, weight: .bold, size: 16.0)
            case .paragraph:
                return UIFont(fontName: .sanFrancisco, weight: .regular, size: 14.0)
            case .label:
                return UIFont(fontName: .sanFrancisco, weight: .medium, size: 14.0)
            }
        }
    }
    
    convenience init(fontName: FontName, weight: FontWeight, size: CGFloat) {
        self.init(name: fontName.rawValue + "-" + weight.rawValue, size: size)!
    }
    
    static func style(_ style: FontStyle) -> UIFont {
        return style.value
    }
}
