import Foundation
import Networking

struct EnvironmentedRequestComposer {
    
    static let `default`: EnvironmentedRequestComposer = EnvironmentedRequestComposer()
    
    private(set) var composer: URLRequestComposer
    private(set) var environment: Environment
    
    init(environment: Environment = .default, commonHeaders: [HeaderType: HeaderValue] = [:]) {
        self.environment = environment
        self.composer = URLRequestComposer(scheme: environment.urlScheme, host: environment.urlHost, commonHeaders: commonHeaders)
    }
}
