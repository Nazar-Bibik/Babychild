//
//  SleepRecord.swift
//  BabyChild
//
//  Created by Mow on 26/11/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import Foundation
import CoreData

public class SleepEvent: NSManagedObject, Identifiable {
    @NSManaged public var childid: NSNumber
    @NSManaged public var timestart: Date
    @NSManaged public var timestop: Date
    @NSManaged public var isnight: NSNumber
}

extension SleepEvent {
    static func getAll() -> NSFetchRequest<SleepEvent> {
        let request: NSFetchRequest<SleepEvent> = SleepEvent.fetchRequest() as! NSFetchRequest<SleepEvent>
        request.sortDescriptors = [NSSortDescriptor(key: "childid", ascending: true)]

        return request
    }
}
