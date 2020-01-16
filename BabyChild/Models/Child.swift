//
//  Child.swift
//  BabyChild
//
//  Created by Mowsumi Rahman on 27/10/2019.
//  Copyright © 2019 Mowsumi Rahman. All rights reserved.
//

import Foundation
import SwiftUI


// One Child profile handler
class Child: ObservableObject{
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @Published var childData: ChildData = ChildData()
    @Published var childEvent: ChildEvent = ChildEvent()
    
    init(childData: ChildData?) {
        recreate(childData: childData)
    }
    
    // Use a new child
    func recreate(childData: ChildData?){
        if (childData != nil){
            self.childData = childData!
            do {
                self.childEvent = try context.fetch(ChildEvent.getAll()).first(where: { $0.childid == childData!.id} )!
            } catch {
                print("Error while getting a childEvent, \(error)")
            }
        }
    }
    
    // Updates CoreData
    func saveContext() {
        if context.hasChanges{
            do {
                try context.save()
                recreate(childData: childData)
            } catch  {
                print("Error while saving child, \(error)")
            }
        }
    }
    
    func age() -> Int{
        return DateHelper.difDays(datetime: childData.dob)
    }
    
    func sleep() {
        childEvent.sleeping = NSNumber(value: childEvent.sleeping.isEqual(to: 0))
        childEvent.sleeptime = Date()
        saveContext()
    }
    
    func feed() {
        childEvent.feedtime = Date()
        saveContext()
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
        return Image(uiImage: UIImage(data: childData.picture as Data)!)
    }
    
    func showName() -> String{
        return childData.name
    }
    
    func showSleepButton() -> String{
        if childEvent.sleeping.boolValue{
            return "Sleeping"
        }
        return " Awake "
    }
    
    func showSleepInfo() -> String{
        if childEvent.sleeptime != nil{
            if childEvent.sleeping.boolValue{
                return "Sleeping for " + showSleepTime()
            }
            return "Awake for " + showSleepTime()
        }
        return ""
    }
    
    func showSleepTime() -> String{
        if childEvent.sleeptime != nil{
            return DateHelper.showTimeFrom(datetime: childEvent.sleeptime!)
        }
        return ""
    }
    
    func isSleeping() -> Bool{
        return childEvent.sleeping != 0
    }
    
    func showFeedInfo() -> String{
        if childEvent.feedtime != nil{
            return DateHelper.showTimeFrom(datetime: childEvent.feedtime!)
        }
        return ""
    }
}
