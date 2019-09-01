import Foundation

struct Vehicle: Codable {
    let vrm: String
    let prettyVrm: String
    let make: VehicleMake
    let model: String
    let variant: String?
    let color: String
}
