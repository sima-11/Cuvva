import Foundation

enum VehicleMake: Codable {
    
    enum VehicleMakeCodingKey: CodingKey {
        case make
    }
    
    case mercedes
    case mini
    case volkswagen
    case other(String)
    
    var name: String {
        switch self {
        case .mercedes: return "Mercedes-Benz"
        case .mini: return "MINI"
        case .volkswagen: return "Volkswagen"
        case .other(let name): return name
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let make = try container.decode(String.self)
        switch make {
        case VehicleMake.mercedes.name: self = .mercedes
        case VehicleMake.mini.name: self = .mini
        case VehicleMake.volkswagen.name: self = .volkswagen
        default: self = .other(make)
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.name)
    }
}
