import Foundation
import DateConverter

protocol PolicyPayload {
    var policyID: String { get set }
}

// MARK: Policy Created
struct PolicyCreatedPayload: Codable, PolicyPayload {
    private enum PolicyCreatedPayloadCodingKey: String, CodingKey {
        case policyID = "policy_id"
        case originalPolicyID = "original_policy_id"
        case userID = "user_id"
        case userRevision = "user_revision"
        case referenceCode = "reference_code"
        case startDate = "start_date"
        case endDate = "end_date"
        case incidentPhoneNumber = "incident_phone"
        case vehicle
        case documents
    }
    
    var policyID: String
    let originalPolicyID: String
    let userID: String
    let userRevision: String
    let referenceCode: String
    let startDate: Date
    let endDate: Date
    let incidentPhoneNumber: String
    let vehicle: Vehicle
    let documents: Documents
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PolicyCreatedPayloadCodingKey.self)
        self.policyID = try container.decode(String.self, forKey: .policyID)
        self.originalPolicyID = try container.decode(String.self, forKey: .originalPolicyID)
        self.userID = try container.decode(String.self, forKey: .userID)
        self.userRevision = try container.decode(String.self, forKey: .userRevision)
        self.referenceCode = try container.decode(String.self, forKey: .referenceCode)
        self.startDate = try container.decodeDate(withFormat: .iso8601, forKey: .startDate)
        self.endDate = try container.decodeDate(withFormat: .iso8601, forKey: .endDate)
        self.incidentPhoneNumber = try container.decode(String.self, forKey: .incidentPhoneNumber)
        self.vehicle = try container.decode(Vehicle.self, forKey: .vehicle)
        self.documents = try container.decode(Documents.self, forKey: .documents)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: PolicyCreatedPayloadCodingKey.self)
        try container.encode(policyID, forKey: .policyID)
        try container.encode(originalPolicyID, forKey: .originalPolicyID)
        try container.encode(userID, forKey: .userID)
        try container.encode(userRevision, forKey: .userRevision)
        try container.encode(referenceCode, forKey: .referenceCode)
        try container.encodeDate(startDate, withFormat: .iso8601, forKey: .startDate)
        try container.encodeDate(endDate, withFormat: .iso8601, forKey: .endDate)
        try container.encode(incidentPhoneNumber, forKey: .incidentPhoneNumber)
        try container.encode(vehicle, forKey: .vehicle)
        try container.encode(documents, forKey: .documents)
    }
}

extension PolicyCreatedPayload {
    
    struct Documents: Codable {
        
        private enum DocumentsCodingKey: String, CodingKey {
            case certificateURL = "certificate_url"
            case termsURL = "terms_url"
        }
        
        let certificateURL: URL
        let termsURL: URL
        
        init(from decoder: Decoder) throws {
            
            let container = try decoder.container(keyedBy: DocumentsCodingKey.self)
            self.certificateURL = try container.decode(URL.self, forKey: .certificateURL)
            self.termsURL = try container.decode(URL.self, forKey: .termsURL)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: DocumentsCodingKey.self)
            try container.encode(certificateURL, forKey: .certificateURL)
            try container.encode(termsURL, forKey: .termsURL)
        }
    }
}

// MARK: Policy Financial Transaction
struct PolicyFinancialTransactionPayload: Codable, PolicyPayload {
    
    private enum FinancialTransactionCodingKey: String, CodingKey {
        case policyID = "policy_id"
        case pricing
    }
    
    var policyID: String
    let pricing: PolicyPricing
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: FinancialTransactionCodingKey.self)
        self.policyID = try container.decode(String.self, forKey: .policyID)
        self.pricing = try container.decode(PolicyPricing.self, forKey: .pricing)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: FinancialTransactionCodingKey.self)
        try container.encode(policyID, forKey: .policyID)
        try container.encode(pricing, forKey: .pricing)
    }
}

// MARK: Policy Cancelled
struct PolicyCancelledPayload: Codable, PolicyPayload {
    
    private enum CancelledCodingKey: String, CodingKey {
        case policyID = "policy_id"
        case type
        case newEndDate = "new_end_date"
    }
    
    var policyID: String
    let type: CancelledType
    let newEndDate: Date?
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CancelledCodingKey.self)
        self.policyID = try container.decode(String.self, forKey: .policyID)
        self.type = try container.decode(CancelledType.self, forKey: .type)
        self.newEndDate = try container.decodeDateIfPresent(withFormat: .iso8601, forKey: .newEndDate)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CancelledCodingKey.self)
        try container.encode(policyID, forKey: .policyID)
        try container.encode(type, forKey: .type)
        try container.encodeDate(newEndDate, withFormat: .iso8601, forKey: .newEndDate)
    }
}

extension PolicyCancelledPayload {
    
    enum CancelledType: String, Codable {
        case void
    }
}
