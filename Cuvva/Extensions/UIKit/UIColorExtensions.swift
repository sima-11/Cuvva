import UIKit

extension UIColor {
    
    struct Theme {
        
        static var white: UIColor {
            if #available(iOS 11.0, *) {
                return UIColor(named: "white")!
            } else {
                return UIColor(white: 1.0, alpha: 1.0)
            }
        }
        
        static var violet: UIColor {
            if #available(iOS 11.0, *) {
                return UIColor(named: "violet")!
            } else {
                return UIColor(red: 72.0/255.0, green: 57.0/255.0, blue: 205.0/255.0, alpha: 1.0)
            }
        }
        
        static var violetLight: UIColor {
            if #available(iOS 11.0, *) {
                return UIColor(named: "violetLight")!
            } else {
                return UIColor(red: 98.0/255.0, green: 80.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            }
        }
        
        static var violetUltraLight: UIColor {
            if #available(iOS 11.0, *) {
                return UIColor(named: "violetUltraLight")!
            } else {
                return UIColor(red: 240.0/255.0, green: 236.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            }
        }
        
        static var violetDark: UIColor {
            if #available(iOS 11.0, *) {
                return UIColor(named: "violetDark")!
            } else {
                return UIColor(red: 16.0/255.0, green: 0.0/255.0, blue: 146.0/255.0, alpha: 1.0)
            }
        }
        
        static var green: UIColor {
            if #available(iOS 11.0, *) {
                return UIColor(named: "green")!
            } else {
                return UIColor(red: 0.0/255.0, green: 239.0/255.0, blue: 148.0/255.0, alpha: 1.0)
            }
        }
        
        static var yellow: UIColor {
            if #available(iOS 11.0, *) {
                return UIColor(named: "yellow")!
            } else {
                return UIColor(red: 255.0/255.0, green: 214.0/255.0, blue: 0.0/255.0, alpha: 1.0)
            }
        }
        
        static var red: UIColor {
            if #available(iOS 11.0, *) {
                return UIColor(named: "red")!
            } else {
                return UIColor(red: 255.0/255.0, green: 0.0/255.0, blue: 26.0/255.0, alpha: 1.0)
            }
        }
        
        static var grey: UIColor {
            if #available(iOS 11.0, *) {
                return UIColor(named: "grey")!
            } else {
                return UIColor(red: 144.0/255.0, green: 140.0/255.0, blue: 161.0/255.0, alpha: 1.0)
            }
        }
    }
}
