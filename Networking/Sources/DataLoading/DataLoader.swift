import Foundation

open class DataLoader {
    
    enum DataTaskError: LocalizedError {
        case noDataReceived
        case noResponseReceived
        case unexpected
    }
    
    let session: URLSession
    
    public init(session: URLSession = URLSession(configuration: URLSessionConfiguration.default)) {
        self.session = session
    }
    
    open func dataTask(with request: URLRequest, completion: @escaping (DataTaskResult?, Error?) -> Void) {
        session.dataTask(with: request, completionHandler: { (data, urlResponse, error) in
            
            guard error == nil else {
                completion(nil, error)
                return
            }
            guard let response = urlResponse else {
                let error = DataTaskError.noResponseReceived
                completion(nil, error)
                return
            }
            guard let data = data else {
                let error = DataTaskError.noDataReceived
                completion(nil, error)
                return
            }
            
            let result = DataTaskResult(data: data, urlResponse: response)
            completion(result, nil)
            
        }).resume()
    }
}
