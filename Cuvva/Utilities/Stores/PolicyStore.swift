import Foundation
import API

class PolicyStore {
    
    static let `default` = PolicyStore()
    
    var created: [String: Policy]
    var financialTransaction: [String: [Policy]]
    var cancelled: [String: Policy]
    
    fileprivate let service: PolicyService
    fileprivate let coreDataManager: CoreDataManager
    
    init(service: PolicyService = .default, coreDataManager: CoreDataManager = .default) {
        self.service = service
        self.coreDataManager = coreDataManager
        
        self.created = [:]
        self.financialTransaction = [:]
        self.cancelled = [:]
        
        let policyMOs: [PolicyMO] = coreDataManager.fetchAll() ?? []
        let policies = policyMOs.compactMap({ $0.toPolicy() })
        splitPolicies(policies)
    }
    
    func splitPolicies(_ policies: [Policy]) {
        for policy in policies {
            switch policy.type {
            case .created: created[policy.payload.policyID] = policy
            case .financialTransaction:
                if var stored = financialTransaction[policy.payload.policyID] {
                    stored.append(policy)
                    financialTransaction[policy.payload.policyID] = stored
                }
                else {
                    financialTransaction[policy.payload.policyID] = [policy]
                }
            case .cancelled: cancelled[policy.payload.policyID] = policy
            }
        }
    }
}

// MARK: Networking
extension PolicyStore {
    
    func fetchPolicies(completion: ((Error?) -> Void)? = nil) {
        service.fetchPolicies() { (policies, error) in
            if let policies = policies {
                self.splitPolicies(policies)
                self.coreDataManager.savePolicies(policies)
            }
            
            completion?(error)
        }
    }
}
