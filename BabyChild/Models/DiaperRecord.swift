//
//  DiaperRecord.swift
//  BabyChild
//
//  Created by Mowsumi Rahman on 27/11/2019.
//  Copyright © 2019 Mowsumi Rahman. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI


// Helper class to control diaper records and display them
class DiaperRecord: ObservableObject {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @Published var diaperEvents: [DiaperEvent] = []
    var childid: NSNumber
    
    init(childData: ChildData?) {
        childid = childData!.id
        do {
            diaperEvents = try context.fetch(DiaperEvent.getAll()).filter { $0.childid == childid}
        } catch {
            print("Error while getting a diaperEvent, \(error)")
        }
    }
    
    func saveContext() {
        if context.hasChanges{
            do {
                try context.save()
                diaperEvents = try context.fetch(DiaperEvent.getAll()).filter { $0.childid == childid}
            } catch  {
                print("Error while saving context of DiaperEvent, \(error)")
            }
        }
    }
    
    func newRecord(type: Int, note: String = ""){
        let new = DiaperEvent(context: context)
        new.time = Date()
        new.childid = childid
        new.type = NSNumber(value: type)
        new.note = note
        
        saveContext()
    }
}

extension DiaperRecord{
    func showTime(item: DiaperEvent) -> String{
        return DateHelper.showTime(datetime: item.time)
    }
    
    func showType(item: DiaperEvent) -> String{
        switch item.type {
        case 1:
            return "SOLID"
        case 0:
            return "LIQUID"
        default:
            return "BOTH"
        }
    }
}
