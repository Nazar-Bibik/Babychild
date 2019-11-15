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
import CoreData

public class Child: NSManagedObject, Identifiable{
    @NSManaged public var Sleep: Bool
    @NSManaged public var SleepTime: Date?
    @NSManaged public var FeedTime: Date?
    
    @NSManaged public var id: Int
    @NSManaged public var Name: String
    @NSManaged public var Surname: String
    @NSManaged public var BirthDate: String
    @NSManaged public var Health: Bool
    @NSManaged public var Picture: String
    @NSManaged public var Gender: String
    @NSManaged public var BloodType: String

    
    func age() -> Int{
        return DateHelper.difDays(datetime: DOB)
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
        return image
    }
    
    func showName() -> String{
        return Name
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

extension Child {
    var image: Image {
//        ImageStore.shared.image(name: imageName)
//        Image("default")
        Image(Picture)
    }
}

extension Child {
    var DOB: Date {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd HH:mm"
        return dateFormater.date(from: BirthDate)!
    }
}

extension Child{
    static func childFetchRequest() -> NSFetchRequest<Child> {
        let request: NSFetchRequest<Child> = Child.fetchRequest() as! NSFetchRequest<Child>
        request.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
          
        return request
    }
}

extension Child{
    static func childCheckRequest(id: Int) -> NSFetchRequest<Child> {
        let request: NSFetchRequest<Child> = Child.fetchRequest() as! NSFetchRequest<Child>
        do {
            try request.predicate =  NSPredicate(format: "id == %@", id)
        } catch {
            DataHelper.removeChild()
        }
        request.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
        
        return request
    }
}
