import Foundation

enum InfoPlistKeys: String {
    case configuration = "Configuration"
    case urlScheme = "URLScheme"
    case urlHost = "URLHost"
}

struct Environment {
    
    static var `default`: Environment = {
        return Environment(infoDictionary: Bundle.main.infoDictionary!)
    }()
    
    private let infoDictionary: [String: Any]
    private let configurationDictionary: [String: Any]
    
    private init(infoDictionary: [String: Any]) {
        self.infoDictionary = infoDictionary
        self.configurationDictionary = self.infoDictionary[InfoPlistKeys.configuration.rawValue] as! [String: Any]
    }
    
    var urlScheme: String {
        return self.configurationDictionary[InfoPlistKeys.urlScheme.rawValue] as! String
    }
    
    var urlHost: String {
        return self.configurationDictionary[InfoPlistKeys.urlHost.rawValue] as! String
    }
}
