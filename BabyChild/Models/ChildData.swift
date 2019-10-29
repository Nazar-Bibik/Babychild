//
//  ChildData.swift
//  BabyChild
//
//  Created by Mow on 26/10/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI

struct ChildData: Equatable, Hashable, Codable {
    var id: Int
    var Name: String
    var Surname: String
    var DOB: String
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
        case girl = "girl"
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




