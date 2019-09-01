import Foundation

extension String {
    
    public func toDate(withFormat format: DateConverter.DateFormat) throws -> Date {
        return try DateConverter().toDate(from: self, withFormat: format)
    }
    
    public func toDate(withTemplate template: DateConverter.DateTemplate, locale: Locale?) throws -> Date {
        return try DateConverter().toDate(from: self, withTemplate: template, withLocale: locale)
    }
}
