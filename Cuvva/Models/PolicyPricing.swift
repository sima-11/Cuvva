import Foundation

struct PolicyPricing: Codable {
    
    private enum PricingCodingKey: String, CodingKey {
        case underwriterPremium = "underwriter_premium"
        case commission = "commission"
        case totalPremium = "total_premium"
        case ipt
        case iptRate = "ipt_rate"
        case extraFees = "extra_fees"
        case vat
        case deductions
        case totalPayable = "total_payable"
    }
    
    let underwriterPremium: Int
    let commission: Int
    let totalPremium: Int
    let ipt: Int
    let iptRate: Int
    let extraFees: Int
    let vat: Int
    let deductions: Int
    let totalPayable: Int
    
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: PricingCodingKey.self)
        self.underwriterPremium = try container.decode(Int.self, forKey: .underwriterPremium)
        self.commission = try container.decode(Int.self, forKey: .commission)
        self.totalPremium = try container.decode(Int.self, forKey: .totalPremium)
        self.ipt = try container.decode(Int.self, forKey: .ipt)
        self.iptRate = try container.decode(Int.self, forKey: .iptRate)
        self.extraFees = try container.decode(Int.self, forKey: .extraFees)
        self.vat = try container.decode(Int.self, forKey: .vat)
        self.deductions = try container.decode(Int.self, forKey: .deductions)
        self.totalPayable = try container.decode(Int.self, forKey: .totalPayable)
    }
    
    func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: PricingCodingKey.self)
        try container.encode(underwriterPremium, forKey: .underwriterPremium)
        try container.encode(commission, forKey: .commission)
        try container.encode(totalPremium, forKey: .totalPremium)
        try container.encode(ipt, forKey: .ipt)
        try container.encode(iptRate, forKey: .iptRate)
        try container.encode(extraFees, forKey: .extraFees)
        try container.encode(vat, forKey: .vat)
        try container.encode(deductions, forKey: .deductions)
        try container.encode(totalPayable, forKey: .totalPayable)
    }
}
