//: Playground - noun: a place where people can play

import Foundation

let date = Date()
let pastDate = Date(timeIntervalSinceNow: -60 * 60 * 24 * 7)

extension Date {
    func relativlyFormatter() -> String {
        let secondsAgo = Int(Date().timeIntervalSince(self))
        
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        
        switch secondsAgo {
        case 5..<minute:
            return "\(secondsAgo) seconds ago"
        case minute..<hour:
            return "\(secondsAgo) minutes ago"
        case hour..<day:
            return "\(secondsAgo) hours ago"
        case day..<week:
            return "\(secondsAgo) days ago"
        default:
            return "just now"
        }
    }
}

pastDate.relativlyFormatter()
