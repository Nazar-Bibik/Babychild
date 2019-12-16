//
//  DateHelper.swift
//  BabyChild
//
//  Created by Mow on 06/11/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import Foundation
import SwiftUI

class DateHelper {
    static func current() -> Date {
        return Date()
    }
    // return number of days from give date till todays
    static func difDays(datetime: Date) -> Int {
        let calendar = Calendar.current
        let birth = calendar.startOfDay(for: datetime)
        let now = calendar.startOfDay(for: Date())
        let components = calendar.dateComponents([.day], from: birth, to: now)
        
        return components.day!
    }
    // return number of minutes from given time till now
    static func difMinutes(datetime: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.minute], from: datetime, to: Date())
        
        return components.minute!
    }
    // return formated string of time passed
    static func showTimeFrom(datetime: Date) -> String {
        let minutes = difMinutes(datetime: datetime)
        return showTimeFormated(minutes: minutes)
    }
    // return string of time from given number of minutes
    static func showTimeFormated(minutes: Int) -> String {
        let hour = minutes / 60
        let minute = minutes % 60
        let minutez = minute < 10 ? "0" : ""
        let hourz = hour < 10 ? "0" : ""
        return hourz + String(hour) + ":" + minutez + String(minute)
    }
    
    static func showTime(datetime: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"

        return "\(dateFormatter.string(from: datetime))"
    }
    
    static func showDate(datetime: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY MMM d. E"

        return "\(dateFormatter.string(from: datetime))"
    }
}
