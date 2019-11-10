//
//  ChildData.swift
//  BabyChild
//
//  Created by Mow on 26/10/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI
import UIKit
import Foundation

struct ChildData: Equatable, Hashable, Codable {
    var id: Int
    var Name: String
    var Surname: String
    var BirthDate: String
    var Health: Bool
    fileprivate var Picture: String
    var Gender: Gender
    var BloodType: BloodType

    enum BloodType: String, CaseIterable, Codable, Hashable {
        case a = "A"
        case b = "B"
        case ab = "AB"
        case o = "O"
    }

    enum Gender: String, CaseIterable, Codable, Hashable {
        case girls = "girl"
        case boy = "boy"
    }
    
    
//    init(id: Int, Name: String, Surname: String, DOB: Date, Health: Bool, Picture: String, Bloodtype: String, Gender: String){
//        self.id = id
//        self.Name = Name
//        self.Surname = Surname
//        self.DOB = DOB
//        self.Health = Health
//        self.Picture = Picture
//        self.BloodType = Bloodtype
//        self.Gender = Gender
//    }
}

extension ChildData {
    var image: Image {
//        ImageStore.shared.image(name: imageName)
//        Image("default")
        Image(Picture)
    }
}

extension ChildData {
    var DOB: Date {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd HH:mm"
        return dateFormater.date(from: BirthDate)!
    }
}





