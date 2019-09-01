import UIKit

class ReceiptCell: UITableViewCell {
    
    var viewModel: ReceiptCellViewModel? {
        didSet {
            guard let viewModel = self.viewModel else {
                resetContent()
                return
            }
            textLabel?.text = viewModel.title
            detailTextLabel?.text = viewModel.amount
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        applyStyle()
    }
    
    func applyStyle() {
        guard let viewModel = viewModel else { return }
        if viewModel.row == .total {
            textLabel?.style(color: UIColor.Theme.violetDark, fontStyle: .bodyBold)
        }
        else {
            textLabel?.style(color: UIColor.Theme.violetDark, fontStyle: .body)
        }
        detailTextLabel?.style(color: UIColor.Theme.violetDark, fontStyle: .body)
    }
    
    func resetContent() {
        textLabel?.text = nil
        detailTextLabel?.text = nil
    }
}
