//
//  BabyChildTests.swift
//  BabyChildTests
//
//  Created by Mow on 21/10/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import XCTest
import CoreData
import Foundation
@testable import BabyChild

class BabyChildTests: XCTestCase {
//    var child: Child = Child(childData: Children().current())
    var children = Children()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func setUp() {
//
    }

    override func tearDown() {
        do {
        let previous = try context.fetch(ChildData.getAll())
            if previous.count != 0{
                for obj in previous{
                    let cid = obj.id
                    context.delete(obj)
                    do {
                        try context.delete(context.fetch(ChildEvent.getAll()).first(where: { Int(truncating: $0.childid) == Int(truncating: cid)} )!)
                    } catch {
                        print("Error while deleting a childEvent, \(error)")
                    }
                    if context.hasChanges{
                        do {
                            try context.save()
                        } catch  {
                            print("Error while saving child, \(error)")
                        }
                    }
                }
            }
        } catch {
            print("error")
        }
    }

    func testChildAddCorrectData1(){
        XCTAssertEqual(children.add(name: "K", surname: "J", dob: Date() - 7, health: true, picture: "default", gender: true, blood: ""), true)
    }
    
    func testChildAddCorrectData2(){
         XCTAssertEqual(children.add(name: "K", surname: "", dob: Date(), health: true, picture: "default", gender: nil, blood: ""), false)
    }
    
    func testPerformanceAddChild() {
        self.measure {
            _ = children.add(name: "K", surname: "J", dob: Date() - 7, health: true, picture: "default", gender: true, blood: "")
        }
    }
    
    func testPerformanceRemoveChild() {
        _ = children.add(name: "K", surname: "J", dob: Date() - 7, health: true, picture: "default", gender: true, blood: "")
        self.measure {
            if children.childrenData.count != 0{
                children.delete(index: 0)
            }
        }
    }
    
    //    func testExample() {
    //        // This is an example of a functional test case.
    //        // Use XCTAssert and related functions to verify your tests produce the correct results.
    //    }
    //
    //    func testPerformanceExample() {
    //        // This is an example of a performance test case.
    //        self.measure {
    //            // Put the code you want to measure the time of here.
    //        }
    //    }
    
//    child = Child(childData: ChildData())
            // Put setup code here. This method is called before the invocation of each test method in the class.
    //            do{
    //            while try context.fetch(ChildData.getAll()).count != 0{
    //            children.delete(index: 0)
    //                }
    //            } catch {
    //                print("Error while getting all children, \(error)")
    //            }
    //        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ChildData")
    //        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
    //
    //                do {
    //                    try coreDataManager.managedObjectContext.execute(batchDeleteRequest)
    //                } catch {
    //                    print("Detele all data in \("ChildData") error :", error)
    //                }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}


