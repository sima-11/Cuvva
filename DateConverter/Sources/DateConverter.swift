import Foundation

public enum DateConversionError: Error {
    case failedConvertingFromString(_ string: String)
}

public struct DateConverter {
    
    public enum DateFormat {
        case iso8601
        case custom(format: String)
        
        public var value: String {
            switch self {
            case .iso8601: return "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
            case .custom(let format): return format
            }
        }
    }
    
    public enum DateTemplate {
        case yyyyMMddHHmmss
        case custom(template: String)
        
        var value: String {
            switch self {
            case .yyyyMMddHHmmss: return "yyyyMMddHHmmss"
            case .custom(let template): return template
            }
        }
    }
    
    private let dateFormatter: DateFormatter
    
    public init() {
        self.dateFormatter = DateFormatter()
    }
    
    private func toDate(from dateString: String, withFormat format: String?) throws -> Date {
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = format
        guard let date = dateFormatter.date(from: dateString), dateString != "" else {
            throw DateConversionError.failedConvertingFromString(dateString)
        }
        return date
    }
    
    private func toString(from date: Date, withFormat format: String?) -> String {
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
}

extension DateConverter {
    
    public func toDate(from dateString: String, withFormat format: DateFormat) throws -> Date {
        return try toDate(from: dateString, withFormat: format.value)
    }
    
    public func toString(from date: Date, withFormat format: DateFormat) -> String {
        return toString(from: date, withFormat: format.value)
    }
    
    public func toDate(from dateString: String, withTemplate template: DateTemplate, withLocale locale: Locale?) throws -> Date {
        let format = DateFormatter.dateFormat(fromTemplate: template.value, options: 0, locale: locale)
        return try toDate(from: dateString, withFormat: format)
    }
    
    public func toString(from date: Date, withTemplate template: DateTemplate, withLocale locale: Locale?) -> String {
        let format = DateFormatter.dateFormat(fromTemplate: template.value, options: 0, locale: locale)
        return toString(from: date, withFormat: format)
    }
}
