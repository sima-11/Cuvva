import Foundation

struct ReceiptCellViewModel {
    
    var title: String {
        return row.title
    }
    
    var amount: String {
        let value: Int
        switch row {
        case .premium: value = pricing.totalPremium
        case .tax: value = pricing.vat
        case .adminFee: value = pricing.commission + pricing.extraFees // Not sure if this is correct though
        case .total: value = pricing.totalPayable
        }
        
        let minus = value < 0 ? "-" : ""
        let absValue = abs(value)
        
        // For demo purpose, hardcode minor units and currency symbol here
        let minorUnits = 100
        let currencySymbol = "£"
        let decimalLeft = absValue / minorUnits
        let decimalRight = absValue % minorUnits
        return "\(minus)\(currencySymbol)\(decimalLeft).\(decimalRight)"
    }
    
    let pricing: PolicyPricing
    let row: ReceiptRow
    
    init(pricing: PolicyPricing, row: ReceiptRow) {
        self.pricing = pricing
        self.row = row
    }
}
