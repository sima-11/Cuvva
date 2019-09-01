import Foundation

extension Date {
    
    public func toString(withFormat format: DateConverter.DateFormat) -> String {
        return DateConverter().toString(from: self, withFormat: format)
    }
    
    public func toString(fromTemplate template: DateConverter.DateTemplate, locale: Locale? = .current) -> String {
        return DateConverter().toString(from: self, withTemplate: template, withLocale: locale)
    }
}
