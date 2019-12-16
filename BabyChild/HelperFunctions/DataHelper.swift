//
//  DataHelper.swift
//  BabyChild
//
//  Created by Mow on 09/11/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import Foundation
//import UIKit
import SwiftUI

class DataHelper {
    static let childKey = "currentChild"
    static let colors = ["cHeaderBlue", "cHeaderRed", "cHeaderGreen"]
    // Check if there is an active child account
    static func fetchChild() -> Int?{
        return UserDefaults.standard.integer(forKey: childKey)
    }
    static func setChild(id: Int){
        UserDefaults.standard.set(id, forKey: childKey)
    }
    
    static func unsetChild(){
        UserDefaults.standard.removeObject(forKey: childKey)
    }
    
    static func getHeaderColor() -> String{
        let c = UserDefaults.standard.string(forKey: "cHeader")
        if c == nil {
            return "cHeaderBlue"
        }
        return c!
    }
    
    static func setHeaderColor(name: String){
        UserDefaults.standard.set(name, forKey: "cHeader")
    }
    
    static func getThumbnailsFromAlbum(album: Album) -> [Image]{
        let objects = album.pictures!.allObjects as! [Media]
        if objects.count == 0{
            return []
        }
        var clipped: [Image] = []
        for i in 0 ..< (objects.count <= 3 ? objects.count : 3) {
            clipped.append( TC.DataToImage(data: objects[i].thumbnail!) )
        }
        return clipped
    }
    
//    static func getChild() -> [Child]{
//        let childData: [ChildData] = load("testDataChild.json")
//        let childArray = childData.map{ Child(childData: $0) }
//        return childArray
//    }
}
