import Foundation

extension TimeInterval {
    
    func toLiteralPresentation() -> String {
        let totalSeconds = Int(self)
        let totalMinutes = totalSeconds / 60
        let minutes = totalMinutes % 60
        let hours = totalMinutes / 60
        var string = ""
        
        // For demo purpose, we don't differenciate singular and plural here
        if hours > 0 {
            string +=  "\(hours) Hours "
        }
        if minutes > 0 {
            string += "\(minutes) Minutes"
        }
        return string
    }
}
