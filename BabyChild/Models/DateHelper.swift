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
    static func difDays(datetime: Date) -> Int {
        let calendar = Calendar.current
        let birth = calendar.startOfDay(for: datetime)
        let now = calendar.startOfDay(for: Date())
        let components = calendar.dateComponents([.day], from: birth, to: now)
        
        return components.day!
    }
    static func difMinutes(datetime: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.minute], from: datetime)
        
        return components.minute!
    }
    static func showTime(datetime: Date) -> String {
        let minutes = difMinutes(datetime: datetime)
        let hours = minutes / 60
        let minute = minutes % 60
        return String(hours) + ":" + String(minute)
    }
    static func showTimeFormated(minutes: Int) -> String {
        let hours = minutes / 60
        let minute = minutes % 60
        return String(hours) + ":" + String(minute)
    }
}
