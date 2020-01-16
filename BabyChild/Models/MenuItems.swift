//
//  MenuItems.swift
//  BabyChild
//
//  Created by Mowsumi Rahman on 30/10/2019.
//  Copyright © 2019 Mowsumi Rahman. All rights reserved.
//

import Foundation
import SwiftUI

// Used in ListSegueView
struct MenuItems: Equatable, Hashable, Codable{
    var id: Int
    var Name: String
    var Priority: Int
    
    init(i: Int, n: String, p: Int) {
        self.id = i
        self.Name = n
        self.Priority = p
    }
    
    func showName() -> String {
        return Name
    }
    
    func showColor() -> Color {
        if Priority == 2 {
            return Color.red
        }
        if Priority == 1 {
            return Color.blue
        }
        return Color.green
    }
}

