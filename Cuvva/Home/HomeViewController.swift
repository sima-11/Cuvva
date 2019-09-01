import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: HomeViewControllerViewModel!
    
    let policyStore: PolicyStore
    
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
        view.backgroundColor = UIColor.Theme.violetUltraLight
        viewModel = HomeViewControllerViewModel(created: Array(self.policyStore.created.values))
        setupTableView()
        
        // Networking
        policyStore.fetchPolicies(completion: { error in
            self.viewModel = HomeViewControllerViewModel(created: Array(self.policyStore.created.values))
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    
    private func setupTableView() {
        tableView.register(cellClass: VehicleCell.self)
        tableView.register(headerFooterViewClass: LabelHeaderFooterView.self)
        tableView.delaysContentTouches = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100.0
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: UITableView Datasource & Delegate
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let payloads = viewModel.policyCreatedPayloads(at: indexPath)
        
        let cell: VehicleCell = tableView.dequeueReusableCell()!
        let viewModel = VehicleCellViewModel(payloads: payloads)
        cell.viewModel = viewModel
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let payloads = viewModel.policyCreatedPayloads(at: indexPath)
        let viewController: PoliciesViewController = UIStoryboard(name: .policies).viewController()!
        viewController.payloads = payloads
        let navigationController = viewController.embeddedInNavigationController()
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
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
