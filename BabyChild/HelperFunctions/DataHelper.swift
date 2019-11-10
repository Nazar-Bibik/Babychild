//
//  DataHelper.swift
//  BabyChild
//
//  Created by Mow on 09/11/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import Foundation
import UIKit

class DataHelper {
    // Check if there is an active child account
    static func fetchChild() -> Int{
        return UserDefaults.standard.integer(forKey: "currentChild")
    }
    
    static func recordChild(id: Int){
        UserDefaults.standard.set(id, forKey: "currentChild")
    }
    
    static func getChild() -> [Child]{
        let childData: [ChildData] = load("testDataChild.json")
        let childArray = childData.map{ Child(childData: $0) }
        return childArray
    }
}
