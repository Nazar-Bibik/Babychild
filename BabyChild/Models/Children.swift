//
//  Children.swift
//  BabyChild
//
//  Created by Mow on 24/11/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData


class Children: ObservableObject {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @Published var childrenData: [ChildData] = []
    
    init() {getall()}
    
    func getall() {
        do {
            childrenData = try context.fetch(ChildData.getAll())
        } catch {
            print("Error while getting all children, \(error)")
        }
    }
    
    func saveContext() {
        if context.hasChanges{
            do {
                try context.save()
                getall()
            } catch  {
                print("Error while saving child, \(error)")
            }
        }
    }
    
    func add(name: String, surname: String, dob: Date, health: Bool = false, picture: UIImage?, gender: Bool?, blood: String) -> Bool{
        if (name != "" && surname != "" && dob < Date() && gender != nil)
        {
            let new = ChildData(context: context)
            
            if isempty(){
                new.id = 0
                DataHelper.setChild(id: 0)
            } else {
                new.id = NSNumber(value: childrenData.last!.id.intValue + 1)
            }
            if picture != nil{
                new.picture = TC.ImageToBinary(picture: picture!)
            } else {
                new.picture = TC.ImageToBinary(picture: UIImage(imageLiteralResourceName: "default"))
            }
            new.name = name
            new.surname = surname
            new.dob = dob
            new.health = NSNumber(value: health)
            new.gender = NSNumber(value: gender!)
            new.blood = blood
            
            let newE = ChildEvent(context: context)
            newE.childid = new.id
            newE.feedtime = nil
            newE.sleeping = NSNumber(0)
            newE.sleeptime = nil
            
            saveContext()
            
            return true
        }
        return false
    }
    
    func delete(index: Int) {
        let cid = self.childrenData[index].id
        context.delete(self.childrenData[index])
        do {
            try context.delete(context.fetch(ChildEvent.getAll()).first(where: { Int(truncating: $0.childid) == Int(truncating: cid)} )!)
        } catch {
            print("Error while deleting a childEvent, \(error)")
        }
        saveContext()
    }
    
//    func update(index: Int){
//        self.childrenData[index].state = self.creatures[index].state?.isEqual(to: 0) as NSNumber?
//        saveContext()
//    }
    
    func current() -> ChildData?{
        let current = DataHelper.fetchChild()
        if current == nil {return nil}
        return self.childrenData.first(where: {Int(truncating: $0.id)  == current!} )
    }
    
    func isempty() -> Bool{
        return childrenData.count == 0
    }
}



