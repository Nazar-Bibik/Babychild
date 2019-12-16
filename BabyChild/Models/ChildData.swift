//
//  ChildData.swift
//  BabyChild
//
//  Created by Mow on 26/10/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import CoreData
import Foundation

public class ChildData: NSManagedObject, Identifiable {
    @NSManaged public var id: NSNumber
    @NSManaged public var name: String
    @NSManaged public var surname: String
    @NSManaged public var dob: Date
    @NSManaged public var health: NSNumber
    @NSManaged public var picture: NSData
    @NSManaged public var gender: NSNumber
    @NSManaged public var blood: String
}

extension ChildData {
    static func getAll() -> NSFetchRequest<ChildData> {
        let request: NSFetchRequest<ChildData> = ChildData.fetchRequest() as! NSFetchRequest<ChildData>
        request.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]

        return request
    }
}



