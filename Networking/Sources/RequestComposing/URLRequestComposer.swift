import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

public enum HeaderType: String {
    case authorisation = "Authorization"
    case contentType = "Content-Type"
    case accept = "Accept"
}

public enum HeaderValue {
    case json
    case bearer(token: String)
    
    var value: String {
        switch self {
        case .json: return "application/json"
        case .bearer(let token): return "Bearer \(token)"
        }
    }
}

public enum URLComposingError: Error {
    case noBaseURLInserted
    case invalidURL(absoluteString: String)
}

open class URLRequestComposer {
    
    private var scheme: String
    private var host: String
    
    // HTTP headers that will be attached with each URLRequest
    private var commonHeaders: [HeaderType: HeaderValue]
    
    public init(scheme: String, host: String, commonHeaders: [HeaderType: HeaderValue]) {
        self.scheme = scheme
        self.host = host
        self.commonHeaders = commonHeaders
    }
    
    // This request composing function ignores `scheme` and `host`
    public func composeURLRequest(url: URL, httpMethod: HTTPMethod, httpBody: Data? = nil, httpHeaders: [HeaderType: HeaderValue]? = nil, cachePolicy: URLRequest.CachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: TimeInterval = 30.0) throws -> URLRequest {
        
        var request = URLRequest(url: url, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)
        request.httpMethod = httpMethod.rawValue
        request.httpBody = httpBody
        
        var headers = commonHeaders
        if let httpHeaders = httpHeaders {
            headers.merge(httpHeaders) { (_, secondKey) in secondKey }
        }
        for (type, value) in headers {
            request.setValue(value.value, forHTTPHeaderField: type.rawValue)
        }
        
        return request
    }
    
    public func composeAPIRequest(path: String, query: [String: String]? = nil, httpMethod: HTTPMethod, httpBody: Data? = nil, httpHeaders: [HeaderType: HeaderValue]? = nil, cachePolicy: URLRequest.CachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: TimeInterval = 30.0) throws -> URLRequest {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
        
        if let query = query {
            let queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }
            urlComponents.queryItems = queryItems
        }
        
        guard let url = urlComponents.url else {
            throw URLComposingError.invalidURL(absoluteString: urlComponents.url!.absoluteString)
        }
        
        return try composeURLRequest(url: url, httpMethod: httpMethod, httpBody: httpBody, httpHeaders: httpHeaders, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)
    }
}
