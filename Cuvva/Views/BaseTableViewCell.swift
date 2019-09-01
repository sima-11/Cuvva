import UIKit

class BaseTableViewCell: UITableViewCell {
    
    let roundedShadowView: RoundedShadowView
    let stackContentView: UIStackView
    
    required init?(coder aDecoder: NSCoder) {
        self.roundedShadowView = RoundedShadowView(frame: .zero)
        self.stackContentView = UIStackView(frame: .zero)
        
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.roundedShadowView = RoundedShadowView(frame: .zero)
        self.stackContentView = UIStackView(frame: .zero)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    private func setup() {
        addSubviews()
        setupConstraints()
        applyStyle()
    }
    
    private func addSubviews() {
        contentView.addSubview(roundedShadowView)
        roundedShadowView.addSubview(stackContentView)
    }
    
    private func setupConstraints() {
        
        let margin = CGFloat(20)
        let halfMargin = margin / 2
        
        roundedShadowView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            roundedShadowView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: halfMargin),
            roundedShadowView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -halfMargin),
            roundedShadowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
            roundedShadowView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin)
        ])
        
        stackContentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackContentView.topAnchor.constraint(equalTo: roundedShadowView.topAnchor, constant: margin),
            stackContentView.bottomAnchor.constraint(equalTo: roundedShadowView.bottomAnchor, constant: -margin),
            stackContentView.leadingAnchor.constraint(equalTo: roundedShadowView.leadingAnchor, constant: margin),
            stackContentView.trailingAnchor.constraint(equalTo: roundedShadowView.trailingAnchor, constant: -margin)
        ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.roundedShadowView.contentBackgroundColor = UIColor.Theme.grey
        }
        else {
            self.roundedShadowView.contentBackgroundColor = UIColor.Theme.white
        }
    }
    
    private func applyStyle() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
        stackContentView.axis = .vertical
        stackContentView.alignment = .leading
    }
}
