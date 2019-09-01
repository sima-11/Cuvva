import UIKit

// For demo purpose, we keep it simple and only list policies within one section
struct PoliciesViewControllerViewModel {
    
    var title: String {
        return "Vehicle profile"
    }
    
    var vehicleLogoImage: UIImage? {
        return UIImage(named: vehicle.make.name)
    }
    
    var vehicleMakeAndModel: String {
        return vehicle.make.name + " " + vehicle.model
    }
    
    var vrm: String {
        return vehicle.vrm
    }
    
    let payloads: [PolicyCreatedPayload]
    let vehicle: Vehicle
    
    init(payloads: [PolicyCreatedPayload]) {
        guard payloads.count > 0 else { fatalError() }
        // Sorted by descending of endDate
        self.payloads = payloads.sorted(by: { $0.endDate > $1.endDate })
        self.vehicle = payloads[0].vehicle
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return payloads.count
    }
    
    func payload(at indexPath: IndexPath) -> PolicyCreatedPayload {
        return payloads[indexPath.row]
    }
    
    func titleForHeaderFooterView(in section: Int) -> String? {
        return "Policies"
    }
}
