//
//  ChildEvent.swift
//  BabyChild
//
//  Created by Mow on 24/11/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import Foundation
import CoreData

public class ChildEvent: NSManagedObject, Identifiable {
    @NSManaged public var childid: NSNumber
    @NSManaged public var feedtime: Date?
    @NSManaged public var sleeping: NSNumber
    @NSManaged public var sleeptime: Date?
}

extension ChildEvent {
    static func getAll() -> NSFetchRequest<ChildEvent> {
        let request: NSFetchRequest<ChildEvent> = ChildEvent.fetchRequest() as! NSFetchRequest<ChildEvent>
        request.sortDescriptors = [NSSortDescriptor(key: "childid", ascending: true)]

        return request
    }
}
