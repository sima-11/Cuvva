import Foundation
import DateConverter

struct PolicyCellViewModel {
    
    var duration: String {
        if isVoided {
            return "Voided"
        }
        let interval = payload.endDate.timeIntervalSince(payload.startDate)
        return interval.toLiteralPresentation()
    }
    
    var effectiveDate: String {
        let startDate = payload.startDate
        return startDate.toString(fromTemplate: .custom(template: "yyyyMMdEEE"))
    }
    
    let payload: PolicyCreatedPayload
    let isVoided: Bool
    
    init(payload: PolicyCreatedPayload, isVoided: Bool) {
        self.payload = payload
        self.isVoided = isVoided
    }
}
