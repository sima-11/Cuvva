import Foundation

extension KeyedDecodingContainer {
    
    public func decodeDate(withFormat format: DateConverter.DateFormat, forKey key: KeyedDecodingContainer<K>.Key) throws -> Date {
        let dateString = try self.decode(String.self, forKey: key)
        return try dateString.toDate(withFormat: format)
    }
    
    public func decodeDateIfPresent(withFormat format: DateConverter.DateFormat, forKey key: KeyedDecodingContainer<K>.Key) throws -> Date? {
        guard let dateString = try self.decodeIfPresent(String.self, forKey: key) else { return nil }
        return try dateString.toDate(withFormat: format)
    }
    
    public func decodeDate(withTemplate template: DateConverter.DateTemplate, locale: Locale?, forKey key: KeyedDecodingContainer<K>.Key) throws -> Date {
        let dateString = try self.decode(String.self, forKey: key)
        return try dateString.toDate(withTemplate: template, locale: locale)
    }
    
    public func decodeDateIfPresent(withTemplate template: DateConverter.DateTemplate, locale: Locale?, forKey key: KeyedDecodingContainer<K>.Key) throws -> Date? {
        guard let dateString = try self.decodeIfPresent(String.self, forKey: key) else { return nil }
        return try dateString.toDate(withTemplate: template, locale: locale)
    }
}
