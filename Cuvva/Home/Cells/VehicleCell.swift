import UIKit

class VehicleCell: BaseTableViewCell {
    
    let imageTitleSubtitleView: ImageTitleSubtitleView
    
    var viewModel: VehicleCellViewModel? {
        didSet {
            guard let viewModel = self.viewModel else {
                resetContent()
                return
            }
            imageTitleSubtitleView.image = viewModel.vehicleLogo
            imageTitleSubtitleView.title = viewModel.vehicleMake
            imageTitleSubtitleView.subtitle = viewModel.vehicleColorAndModel
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        imageTitleSubtitleView = ImageTitleSubtitleView(frame: .zero)
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        imageTitleSubtitleView = ImageTitleSubtitleView(frame: .zero)
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    convenience init(reuseIdentifier: String = VehicleCell.typeIdentifier) {
        self.init(style: .default, reuseIdentifier: reuseIdentifier)
    }
    
    private func setup() {
        addSubviews()
        setupConstraints()
        applyStyle()
    }
    
    private func addSubviews() {
        stackContentView.addArrangedSubview(imageTitleSubtitleView)
    }
    
    private func setupConstraints() {
        imageTitleSubtitleView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func applyStyle() {
        
    }
    
    func resetContent() {
        imageTitleSubtitleView.image = nil
        imageTitleSubtitleView.title = nil
        imageTitleSubtitleView.subtitle = nil
    }
}
