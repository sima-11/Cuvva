import Foundation

extension Sequence {
    public func toDictionary<Key: Hashable>(withKey key: (Iterator.Element) -> Key) -> [Key: Iterator.Element] {
        var dict: [Key: Iterator.Element] = [:]
        for element in self {
            dict[key(element)] = element
        }
        return dict
    }
}
