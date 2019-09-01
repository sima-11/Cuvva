import Foundation

struct HomeViewControllerViewModel {
    
    var groupedVRMs: [[String]]
    var payloadsDict: [String: [PolicyCreatedPayload]]
    
    init(created: [Policy]) {
        let (groupedPayloads, active, other) = HomeViewControllerViewModel.filterPolicies(created)
        self.groupedVRMs = [active, other]
        self.payloadsDict = groupedPayloads
    }
    
    func numberOfSections() -> Int {
        return groupedVRMs.count
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return groupedVRMs[section].count
    }
    
    func titleForHeaderFooterView(in section: Int) -> String? {
        return section == 0 ? "Active policies" : "Vehicles"
    }
}

// MARK: Helper
extension HomeViewControllerViewModel {
    
    static func filterPolicies(_ created: [Policy]) -> (payloadsDict: [String: [PolicyCreatedPayload]], active: [String], other: [String]) {
        
        var payloadsDict: [String: [PolicyCreatedPayload]] = [:] // [VRM : PolicyCreatedPayload]
        for policy in created {
            // Add payloads into a hash table (dictionary), keyed by VRM
            guard let payload = policy.payload as? PolicyCreatedPayload else { fatalError() }
            if var payloads = payloadsDict[payload.vehicle.vrm] {
                payloads.append(payload)
                payloadsDict[payload.vehicle.vrm] = payloads
            }
            else {
                payloadsDict[payload.vehicle.vrm] = [payload]
            }
        }
        
        var active: [String] = []
        var other: [String] = []
        let now = Date()
        
        // Go through all VRM and split them into  active and other
        for key in payloadsDict.keys {
            var isActive = false
            let payloads = payloadsDict[key]!
            for payload in payloads {
                if payload.startDate <= now && payload.endDate > now {
                    isActive = true
                    break
                }
            }
            if isActive == true {
                active.append(key)
            }
            else {
                other.append(key)
            }
        }
        
        return (payloadsDict, active, other)
    }
    
    func policyCreatedPayloads(at indexPath: IndexPath) -> [PolicyCreatedPayload] {
        let vrm = groupedVRMs[indexPath.section][indexPath.row]
        return payloadsDict[vrm]!
    }
}
