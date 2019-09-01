import UIKit

class LabelHeaderFooterView: UITableViewHeaderFooterView {
    
    var title: String? {
        get {
            return labelView.text
        }
        set {
            labelView.text = newValue
        }
    }
    
    let labelView: LabelView
    
    required init?(coder aDecoder: NSCoder) {
        self.labelView = LabelView(frame: .zero)
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(reuseIdentifier: String?) {
        self.labelView = LabelView(frame: .zero)
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    private func setup() {
        addSubviews()
        setupConstraints()
        applyStyle()
    }
    
    private func addSubviews() {
        addSubview(labelView)
    }
    
    private func setupConstraints() {
        labelView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelView.topAnchor.constraint(equalTo: topAnchor),
            labelView.bottomAnchor.constraint(equalTo: bottomAnchor),
            labelView.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func applyStyle() {
        backgroundView = UIView()
        backgroundView?.backgroundColor = UIColor.Theme.violetUltraLight
        labelView.leadingSpacing = 20
        labelView.trailingSpacing = 20
        labelView.topSpacing = 20
        labelView.bottomSpacing = 5
        labelView.label.style(color: UIColor.Theme.violetDark, fontStyle: .h3)
    }
}
