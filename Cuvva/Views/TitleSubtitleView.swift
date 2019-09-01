import UIKit

@IBDesignable
class TitleSubtitleView: UIStackView {
    
    var title: String? {
        get {
            return titleLabel.text
        }
        set {
            titleLabel.text = newValue
        }
    }
    
    var subtitle: String? {
        get {
            return subtitleLabel.text
        }
        set {
            subtitleLabel.text = newValue
        }
    }
    
    let titleLabel: UILabel
    let subtitleLabel: UILabel
    
    required init(coder: NSCoder) {
        self.titleLabel = UILabel(frame: .zero)
        self.subtitleLabel = UILabel(frame: .zero)
        
        super.init(coder: coder)
        setup()
    }
    
    override init(frame: CGRect) {
        self.titleLabel = UILabel(frame: .zero)
        self.subtitleLabel = UILabel(frame: .zero)
        
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        addSubviews()
        setupConstraints()
        applyDefaultStyle()
    }
    
    private func addSubviews() {
        addArrangedSubview(titleLabel)
        addArrangedSubview(subtitleLabel)
    }
    
    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func applyDefaultStyle() {
        axis = .vertical
        spacing = 5.0
        alignment = .leading
        distribution = .equalCentering
        titleLabel.style(color: UIColor.Theme.violetDark, fontStyle: .h2)
        subtitleLabel.style(color: UIColor.Theme.violetDark, fontStyle: .body)
    }
}
