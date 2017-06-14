//: Playground - noun: a place where people can play

import Foundation

let formatter = DateComponentsFormatter()
formatter.unitsStyle = .full
formatter.allowedUnits = [.year, .month, .day, .hour, .minute, .second]
formatter.string(from: 12345678900)

extension Date {
    var relativelyFormatted: String {
        
        let now = Date()
        let components = Calendar.current.dateComponents([.year, .month, .weekOfYear, .day, .hour, .minute, .second], from: now, to: self)
        
        if let years = components.year, years > 0 {
            return "\(years) year\(years == 1 ? "" : "s") ago"
        }
        
        if let months = components.month, months > 0 {
            return "\(months) year\(months == 1 ? "" : "s") ago"
        }
        
        if let weekOfYears = components.weekOfYear, weekOfYears > 0 {
            return "\(weekOfYears) year\(weekOfYears == 1 ? "" : "s") ago"
        }
        
        if let days = components.day, days > 0 {
            return "\(days) year\(days == 1 ? "" : "s") ago"
        }
        
        if let hours = components.hour, hours > 0 {
            return "\(hours) year\(hours == 1 ? "" : "s") ago"
        }
        
        if let minutes = components.minute, minutes > 0 {
            return "\(minutes) year\(minutes == 1 ? "" : "s") ago"
        }
        
        if let seconds = components.second, seconds > 0 {
            return "\(seconds) year\(seconds == 1 ? "" : "s") ago"
        }
        return "just now"
    }
}

let readableDate = Date(timeIntervalSinceNow: 123456).relativelyFormatted
print(readableDate)