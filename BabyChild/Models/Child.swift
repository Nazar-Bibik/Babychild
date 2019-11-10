//
//  Child.swift
//  BabyChild
//
//  Created by Mow on 27/10/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class Child: Identifiable, ObservableObject{
    @Published var data: ChildData?
    @Published var Sleep: Bool
    @Published var SleepTime: Date?
    @Published var FeedTime: Date?
    
    init(childData: ChildData){
        data = childData
        Sleep = false
        SleepTime = nil
        FeedTime = nil
    }
    
    func age() -> Int{
        return DateHelper.difDays(datetime: data!.DOB)
    }
    
    func sleep() {
        Sleep.toggle()
        SleepTime = Date()
    }
    
}

extension Child{
    func showAgeWeeks() -> String{
        return String(self.age() / 7)
    }
    
    func showAgeDays() -> String{
        return String(self.age() % 7)
    }
    
    func showPicture() -> Image{
        return data!.image
    }
    
    func showName() -> String{
        return data!.Name
    }
    
    func showSleepButton() -> String{
        if Sleep{
            return "Sleeping"
        }
        return "Awake"
    }
    
    func showSleepInfo() -> String{
        if SleepTime != nil{
            if Sleep{
                return "Sleeping for " + showSleepTime()
            }
            return "Awake for " + showSleepTime()
        }
        return ""
    }
    
    func showSleepTime() -> String{
        if SleepTime != nil{
            return DateHelper.showTimeFrom(datetime: SleepTime!)
        }
        return ""
    }
}
