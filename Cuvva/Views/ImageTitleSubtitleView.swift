import UIKit

@IBDesignable
class ImageTitleSubtitleView: UIStackView {
    
    var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
        }
    }
    
    var title: String? {
        get {
            return titleSubtitleView.title
        }
        set {
            titleSubtitleView.title = newValue
        }
    }
    
    var subtitle: String? {
        get {
            return titleSubtitleView.subtitle
        }
        set {
            titleSubtitleView.subtitle = newValue
        }
    }
    
    let imageView: UIImageView
    let titleSubtitleView: TitleSubtitleView
    
    required init(coder: NSCoder) {
        imageView = UIImageView(frame: .zero)
        titleSubtitleView = TitleSubtitleView(frame: .zero)
        
        super.init(coder: coder)
        setup()
    }
    
    override init(frame: CGRect) {
        imageView = UIImageView(frame: .zero)
        titleSubtitleView = TitleSubtitleView(frame: .zero)
        
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        addSubviews()
        setupConstraints()
        applyDefaultStyle()
    }
    
    private func addSubviews() {
        addArrangedSubview(imageView)
        addArrangedSubview(titleSubtitleView)
    }
    
    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 35),
            imageView.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        titleSubtitleView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func applyDefaultStyle() {
        axis = .horizontal
        alignment = .center
        distribution = .equalCentering
        spacing = 10.0
        imageView.tintColor = UIColor.Theme.violetDark
    }
}
