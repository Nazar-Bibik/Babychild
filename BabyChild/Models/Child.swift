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
    @Published var data: ChildData
    @Published var Feed: Bool
    @Published var Sleep: Bool
    @Published var SleepTime: NSDate?
    @Published var FeedTime: NSDate?
    
    init(childData: ChildData){
        data = childData
        Feed = false
        Sleep = false
        SleepTime = nil
        FeedTime = nil
    }
    
    func age() -> Int{
        let calendar = Calendar.current
        let birth = calendar.startOfDay(for: data.DOB)
        let now = calendar.startOfDay(for: Date())
        
        let components = calendar.dateComponents([.day], from: birth, to: now)
        
        return components.day!
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
        return data.image
    }
}
