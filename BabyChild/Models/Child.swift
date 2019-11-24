//
//  Child.swift
//  BabyChild
//
//  Created by Mow on 27/10/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import Foundation
import SwiftUI


class Child: ObservableObject{
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @Published var childData: ChildData
    @Published var childEvent: ChildEvent
    
    init(childData: ChildData) throws{
        self.childData = childData
//        do {
//            childEvent = try context.fetch(ChildEvent.getAll()).first(where: { $0.childid == childData.id} )!
//        } catch {
//            print("You've f**ed up in fetching all, \(error)")
//        }
        childEvent = try context.fetch(ChildEvent.getAll()).first(where: { $0.childid == childData.id } )!
    }
    
    func age() -> Int{
        return DateHelper.difDays(datetime: childData.dob)
    }
    
    func sleep() {
//        Sleep.toggle()
//        SleepTime = Date()
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
        return Image(childData.picture)
    }
    
    func showName() -> String{
        return childData.name
    }
    
    func showSleepButton() -> String{
        if childEvent.sleeping.boolValue{
            return "Sleeping"
        }
        return "Awake"
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
}




//
//struct ChildData: Equatable, Hashable, Codable {
//    var id: Int
//    var Name: String
//    var Surname: String
//    var BirthDate: String
//    var Health: Bool
//    fileprivate var Picture: String
//    var Gender: Gender
//    var BloodType: BloodType
//
//    enum BloodType: String, CaseIterable, Codable, Hashable {
//        case a = "A"
//        case b = "B"
//        case ab = "AB"
//        case o = "O"
//    }
//
//    enum Gender: String, CaseIterable, Codable, Hashable {
//        case girls = "girl"
//        case boy = "boy"
//    }
//
//
////    init(id: Int, Name: String, Surname: String, DOB: Date, Health: Bool, Picture: String, Bloodtype: String, Gender: String){
////        self.id = id
////        self.Name = Name
////        self.Surname = Surname
////        self.DOB = DOB
////        self.Health = Health
////        self.Picture = Picture
////        self.BloodType = Bloodtype
////        self.Gender = Gender
////    }
//}
//
//extension ChildData {
//    var image: Image {
////        ImageStore.shared.image(name: imageName)
////        Image("default")
//        Image(Picture)
//    }
//}
//
//extension ChildData {
//    var DOB: Date {
//        let dateFormater = DateFormatter()
//        dateFormater.dateFormat = "yyyy-MM-dd HH:mm"
//        return dateFormater.date(from: BirthDate)!
//    }
//}
