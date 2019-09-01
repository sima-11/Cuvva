import UIKit

class PolicyCell: UITableViewCell {
    
    var viewModel: PolicyCellViewModel? {
        didSet {
            guard let viewModel = self.viewModel else {
                resetContent()
                return
            }
            textLabel?.text = viewModel.duration
            detailTextLabel?.text = viewModel.effectiveDate
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        applyStyle()
    }
    
    // Force to use .value1 style
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        applyStyle()
    }
    
    private func applyStyle() {
        accessoryType = .disclosureIndicator
        textLabel?.style(color: UIColor.Theme.violetDark, fontStyle: .body)
        detailTextLabel?.style(color: UIColor.Theme.violetDark, fontStyle: .bodyBold)
    }
    
    func resetContent() {
        textLabel?.text = nil
        detailTextLabel?.text = nil
    }
}
