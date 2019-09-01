import UIKit

class ReceiptsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let policyStore: PolicyStore
    
    var policyID: String! {
        didSet {
            let policies = policyStore.financialTransaction[self.policyID] ?? []
            viewModel = ReceiptsViewControllerViewModel(policies: policies)
        }
    }
    
    var viewModel: ReceiptsViewControllerViewModel!
    
    required init?(coder aDecoder: NSCoder) {
        policyStore = .default
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        policyStore = .default
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    init(policyStore: PolicyStore) {
        self.policyStore = policyStore
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        applyStyle()
        setContent()
    }
    
    private func setupTableView() {
        tableView.register(cellClass: ReceiptCell.self)
        tableView.register(headerFooterViewClass: LabelHeaderFooterView.self)
        tableView.delaysContentTouches = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100.0
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func applyStyle() {
        view.backgroundColor = UIColor.Theme.violetUltraLight
        navigationController?.navigationBar.isHidden = false
    }
    
    private func setContent() {
        title = viewModel.title
    }
}

// MARK: UITableView DataSource & Delegate
extension ReceiptsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pricing = viewModel.payload(in: indexPath.section).pricing
        
        let cell: ReceiptCell = tableView.dequeueReusableCell()!
        cell.viewModel = ReceiptCellViewModel(pricing: pricing, row: ReceiptRow(rawValue: indexPath.row)!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: LabelHeaderFooterView = tableView.dequeueHeaderFooterView()!
        headerView.title = viewModel.titleForHeaderFooterView(in: section)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
}
