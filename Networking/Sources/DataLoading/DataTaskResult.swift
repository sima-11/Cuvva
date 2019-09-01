import Foundation

public enum HTTPStatusCode: Int {
    case unexpected = -1
    case success = 200
    case created = 201
    case accepted = 202
    case badRequest = 400
    case unauhtorised = 401
    case notFound = 404
    case serverError = 500
}

public struct DataTaskResult {
    
    public let data: Data
    public let urlResponse: URLResponse
    
    public var statusCode: HTTPStatusCode {
        
        guard let httpURLResponse = self.urlResponse as? HTTPURLResponse, let code = HTTPStatusCode(rawValue: httpURLResponse.statusCode) else {
            return .unexpected
        }
        return code
    }
    
    public func decode<T: Decodable>() throws -> T {
        return try JSONDecoder().decode(T.self, from: data)
    }
}
