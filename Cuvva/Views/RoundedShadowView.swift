import UIKit

@IBDesignable
class RoundedShadowView: UIView {
    
    @IBInspectable var contentBackgroundColor: UIColor? {
        get {
            return contentView.backgroundColor
        }
        set {
            contentView.backgroundColor = newValue
        }
    }
    
    private let contentView: UIView
    
    required init?(coder: NSCoder) {
        self.contentView = UIView(frame: .zero)
        super.init(coder: coder)
        setup()
    }
    
    override init(frame: CGRect) {
        self.contentView = UIView(frame: .zero)
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        addSubviews()
        setupConstraints()
        applyStyle()
    }
    
    private func addSubviews() {
        super.addSubview(contentView)
    }
    
    private func setupConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    private func applyStyle() {
        backgroundColor = .clear
        layer.masksToBounds = false
        layer.applyShadow(color: UIColor.Theme.violet, x: 0.0, y: 1.0, opacity: .opacity05, blur: 10.0)
        contentView.backgroundColor = UIColor.Theme.white
        contentView.layer.masksToBounds = true
        
        let cornerRadius = CGFloat(10.0)
        contentView.layer.cornerRadius = cornerRadius
        layer.cornerRadius = cornerRadius
    }
    
    override func addSubview(_ view: UIView) {
        contentView.addSubview(view)
    }
}
