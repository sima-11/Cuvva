import Foundation

extension KeyedEncodingContainer {
    
    public mutating func encodeDate(_ date: Date?, withFormat format: DateConverter.DateFormat, forKey key: KeyedEncodingContainer<K>.Key) throws {
        let dateString = date?.toString(withFormat: format)
        try self.encode(dateString, forKey: key)
    }
    
    public mutating func encodeDate(_ date: Date?, withTemplate template: DateConverter.DateTemplate, locale: Locale?, forKey key: KeyedEncodingContainer<K>.Key) throws {
        let dateString = date?.toString(fromTemplate: template, locale: locale)
        try self.encode(dateString, forKey: key)
    }
}
