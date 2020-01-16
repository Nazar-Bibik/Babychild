//
//  DiaperEvent.swift
//  BabyChild
//
//  Created by Mowsumi Rahman on 27/11/2019.
//  Copyright © 2019 Mowsumi Rahman. All rights reserved.
//

import Foundation
import CoreData


public class DiaperEvent: NSManagedObject, Identifiable {
    @NSManaged public var childid: NSNumber
    @NSManaged public var time: Date
    @NSManaged public var type: NSNumber
    @NSManaged public var note: String
}

extension DiaperEvent {
    static func getAll() -> NSFetchRequest<DiaperEvent> {
        let request: NSFetchRequest<DiaperEvent> = DiaperEvent.fetchRequest() as! NSFetchRequest<DiaperEvent>
        request.sortDescriptors = [NSSortDescriptor(key: "childid", ascending: true)]

        return request
    }
}
