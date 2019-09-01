import UIKit

@IBDesignable
class LabelView: UIView {
    
    @IBInspectable var topSpacing: CGFloat {
        get {
            return self.labelTopConstraint.constant
        }
        set {
            self.labelTopConstraint.constant = newValue
        }
    }
    
    @IBInspectable var bottomSpacing: CGFloat {
        get {
            return -self.labelBottomConstraint.constant
        }
        set {
            self.labelBottomConstraint.constant = -newValue
        }
    }
    
    @IBInspectable var leadingSpacing: CGFloat {
        get {
            return self.labelLeadingConstraint.constant
        }
        set {
            self.labelLeadingConstraint.constant = newValue
        }
    }
    
    @IBInspectable var trailingSpacing: CGFloat {
        get {
            return self.labelTrailingConstrait.constant
        }
        set {
            self.labelTrailingConstrait.constant = newValue
        }
    }
    
    @IBInspectable var text: String? {
        get {
            return self.label.text
        }
        set {
            self.label.text = newValue
        }
    }
    
    @IBInspectable var textColour: UIColor {
        get {
            return self.label.textColor
        }
        set {
            self.label.textColor = newValue
        }
    }
    
    var label: UILabel
    
    private var labelTopConstraint: NSLayoutConstraint!
    private var labelBottomConstraint: NSLayoutConstraint!
    private var labelLeadingConstraint: NSLayoutConstraint!
    private var labelTrailingConstrait: NSLayoutConstraint!
    
    required init?(coder aDecoder: NSCoder) {
        self.label = UILabel(frame: .zero)
        
        super.init(coder: aDecoder)
        self.setup()
    }
    
    override init(frame: CGRect) {
        self.label = UILabel(frame: .zero)
        
        super.init(frame: frame)
        self.setup()
    }
    
    private func setup() {
        self.addSubview(self.label)
        self.setupDefaultConstraints()
    }
    
    func setupDefaultConstraints() {
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.labelTopConstraint = self.label.topAnchor.constraint(equalTo: self.topAnchor)
        self.labelBottomConstraint = self.label.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        self.labelLeadingConstraint = self.label.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        self.labelTrailingConstrait = self.label.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        
        NSLayoutConstraint.activate([self.labelTopConstraint, self.labelBottomConstraint, self.labelLeadingConstraint, self.labelTrailingConstrait])
    }
}
