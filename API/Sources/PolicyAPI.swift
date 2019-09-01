import Foundation
import Networking

protocol PolicyRequestComposer {
    func fetchPolicies() throws -> URLRequest
}

public struct PolicyAPI: URLRequestComposable, PolicyRequestComposer {
    
    public var composer: URLRequestComposer
    
    public init(composer: URLRequestComposer) {
        self.composer = composer
    }
    
    public func fetchPolicies() throws -> URLRequest {
        return try composer.composeAPIRequest(path: "/v2/5c9c99fe3600006c56d971ba", httpMethod: .get)
    }
}
