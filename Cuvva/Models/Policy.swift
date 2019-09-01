import Foundation
import DateConverter

enum PolicyType: String, Codable {
    
    case created = "policy_created"
    case financialTransaction = "policy_financial_transaction"
    case cancelled = "policy_cancelled"
}

struct Policy: Codable {
    
    private enum PolicyCodingKey: String, CodingKey {
        case type
        case timestamp
        case key = "unique_key"
        case payload
    }
    
    let type: PolicyType
    let timestamp: Date
    let key: String
    let payload: Codable & PolicyPayload
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: PolicyCodingKey.self)
        self.type = try container.decode(PolicyType.self, forKey: .type)
        self.timestamp = try container.decodeDate(withFormat: .iso8601, forKey: .timestamp)
        self.key = try container.decode(String.self, forKey: .key)
        switch type {
        case .created:
            self.payload = try container.decode(PolicyCreatedPayload.self, forKey: .payload)
        case .financialTransaction:
            self.payload = try container.decode(PolicyFinancialTransactionPayload.self, forKey: .payload)
        case .cancelled:
            self.payload = try container.decode(PolicyCancelledPayload.self, forKey: .payload)
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: PolicyCodingKey.self)
        try container.encode(type, forKey: .type)
        try container.encodeDate(timestamp, withFormat: .iso8601, forKey: .timestamp)
        try container.encode(key, forKey: .key)
        switch type {
        case .created:
            try container.encode(payload as! PolicyCreatedPayload, forKey: .payload)
        case .financialTransaction:
            try container.encode(payload as! PolicyFinancialTransactionPayload, forKey: .payload)
        case .cancelled:
            try container.encode(payload as! PolicyCancelledPayload, forKey: .payload)
        }
    }
}
