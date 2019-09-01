import Foundation
import UIKit

struct VehicleCellViewModel {
    
    var vehicleLogo: UIImage? {
        return UIImage(named: vehicle.make.name)
    }
    
    var vehicleMake: String {
        return vehicle.make.name
    }
    
    var vehicleColorAndModel: String {
        return vehicle.color + " " + vehicle.model
    }
    
    let payloads: [PolicyCreatedPayload]
    
    private var vehicle: Vehicle {
        guard let firstPayload = payloads.first else { fatalError() }
        return firstPayload.vehicle
    }
    
    init(payloads: [PolicyCreatedPayload]) {
        self.payloads = payloads
    }
}
