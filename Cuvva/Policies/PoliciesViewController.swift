import UIKit

class PoliciesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topBarView: UIView!
    @IBOutlet weak var topBarLabel: UILabel!
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var imageTitleSubtitleView: ImageTitleSubtitleView!
    
    var payloads: [PolicyCreatedPayload]! {
        didSet {
            viewModel = PoliciesViewControllerViewModel(payloads: self.payloads)
        }
    }
    
    var viewModel: PoliciesViewControllerViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        applyStyle()
        setContent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupTableView() {
        tableView.register(cellClass: PolicyCell.self)
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
        topBarView.backgroundColor = UIColor.Theme.violetLight
        dismissButton.tintColor = UIColor.Theme.white
        topBarLabel.style(color: UIColor.Theme.white, fontStyle: .h2)
        imageTitleSubtitleView.imageView.tintColor = UIColor.Theme.white
        imageTitleSubtitleView.titleSubtitleView.titleLabel.style(color: UIColor.Theme.white, fontStyle: .body)
        imageTitleSubtitleView.titleSubtitleView.subtitleLabel.style(color: UIColor.Theme.white, fontStyle: .h1)
    }
    
    private func setContent() {
        topBarLabel.text = viewModel.title
        imageTitleSubtitleView.image = viewModel.vehicleLogoImage
        imageTitleSubtitleView.title = viewModel.vehicleMakeAndModel
        imageTitleSubtitleView.subtitle = viewModel.vrm
    }
}

// MARK: Actions
extension PoliciesViewController {
    @IBAction func didTouchUpInsideDismissButton(_ button: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: UITableView DataSource & Delegate
extension PoliciesViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let payload = viewModel.payload(at: indexPath)
        
        let cell: PolicyCell = tableView.dequeueReusableCell()!
        
        // Hardcode isVoided as `false` as not sure about the criteria
        cell.viewModel = PolicyCellViewModel(payload: payload, isVoided: false)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let payload = viewModel.payload(at: indexPath)
        let viewController: ReceiptsViewController = UIStoryboard(name: .receipts).viewController()!
        viewController.policyID = payload.policyID
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: LabelHeaderFooterView = tableView.dequeueHeaderFooterView()!
        headerView.title = viewModel.titleForHeaderFooterView(in: section)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
}
