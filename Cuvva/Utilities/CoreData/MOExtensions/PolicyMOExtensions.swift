import Foundation
import CoreData

extension PolicyMO: TypeIdentifiable {
    
    func update(withPolicy policy: Policy) {
        content = try? JSONEncoder().encode(policy)
    }
    
    func toPolicy() -> Policy? {
        guard let content = content else { return nil }
        return try? JSONDecoder().decode(Policy.self, from: content)
    }
}
