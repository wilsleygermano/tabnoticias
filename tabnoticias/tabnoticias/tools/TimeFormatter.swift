//
//  TimeFormatter.swift
//  tabnoticias
//
//  Created by Wilsley Germano on 21/09/23.
//

import Foundation

struct TimeFormatter {
    func relativeTime(from dateString: String) -> String {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withFractionalSeconds, .withInternetDateTime]
        
        if let date = dateFormatter.date(from: dateString) {
            let now = Date()
            let calendar = Calendar.current
            let components = calendar.dateComponents([.hour, .minute, .second], from: date, to: now)
            
            if let hours = components.hour, hours > 24 {
                return "\(hours)d atrás"
            }
            else if let hours = components.hour, hours > 0 {
                return "\(hours)h atrás"
            } else if let minutes = components.minute, minutes > 0 {
                return "\(minutes)m atrás"
            } else {
                return "Just now"
            }
        } else {
            return "Invalid Date"
        }
    }

}
