import Foundation
import DateConverter

enum ReceiptRow: Int, CaseIterable {
    case premium
    case tax
    case adminFee
    case total
    
    var title: String {
        switch self {
        case .premium: return "Insurance premium"
        case .tax: return "Insurance premium tax"
        case .adminFee: return "Admin fee"
        case .total: return "Total paid"
        }
    }
}

struct ReceiptsViewControllerViewModel {
    
    var title: String {
        return "Receipts"
    }
    
    let policies: [Policy]
    let payloads: [PolicyFinancialTransactionPayload]
    
    init(policies: [Policy]) {
        self.policies = policies
        self.payloads = policies.compactMap({ $0.payload as? PolicyFinancialTransactionPayload })
    }
    
    func numberOfSections() -> Int {
        return payloads.count
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return ReceiptRow.allCases.count
    }
    
    func payload(in section: Int) -> PolicyFinancialTransactionPayload {
        return payloads[section]
    }
    
    func titleForHeaderFooterView(in section: Int) -> String? {
        let policy = policies[section]
        return policy.timestamp.toString(fromTemplate: .custom(template: "ddMMyyyyHH:mm"))
    }
}
