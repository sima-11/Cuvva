import Foundation
import Networking
import API

protocol PolicyServiceProtocol {
    
    init(requestComposer: URLRequestComposer)
    func fetchPolicies(completion: @escaping ([Policy]?, Error?) -> Void)
}

struct PolicyService: PolicyServiceProtocol {
    
    static let `default` = PolicyService(requestComposer: EnvironmentedRequestComposer.default.composer)
    
    private let api: PolicyAPI
    
    init(requestComposer: URLRequestComposer) {
        self.api = PolicyAPI(composer: requestComposer)
    }
    
    func fetchPolicies(completion: @escaping ([Policy]?, Error?) -> Void) {
        do {
            let request = try api.fetchPolicies()
            DataLoader().dataTask(with: request, completion: { result, error in
                
                guard let result = result, error == nil else {
                    completion(nil, error)
                    return
                }
                
                do {
                    let policies: [Policy] = try result.decode()
                    completion(policies, nil)
                }
                catch {
                    completion(nil, error)
                }
            })
        }
        catch {
            completion(nil, error)
        }
    }
}
