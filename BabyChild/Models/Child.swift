//
//  Child.swift
//  BabyChild
//
//  Created by Mow on 27/10/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import Foundation
import SwiftUI

class Child: Identifiable{
    var data: ChildData
    var Feed: Bool
    var Sleep: Bool
    var SleepTime: NSDate?
    var FeedTime: NSDate?
    
    init(childData: ChildData){
        data = childData
        Feed = false
        Sleep = false
        SleepTime = nil
        FeedTime = nil
    }
    
    
    
    
}
