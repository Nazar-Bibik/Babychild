//
//  CellChild.swift
//  BabyChild
//
//  Created by Mow on 24/11/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI
import Foundation

// Show child profile
struct CellChild: View {
    var child: ChildData
    
    var body: some View {
        HStack {
            Image(uiImage: UIImage(data: child.picture as Data)!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: Screen.width/3, height: Screen.width/3)
                .clipShape(Circle())
                .scaledToFit()
                .shadow(color: .secondary, radius: 6)
            Text(child.name)
                .fontWeight(.heavy)
                .colorInvert()
                .font(.largeTitle)
                .lineLimit(1)
            Spacer()
        }
    .padding()
    .background(child.gender.boolValue ? Color("boy") : Color("girl"))
    .clipShape(Capsule())
    }
}

//struct CellChild_Previews: PreviewProvider {
//    var child: ChildData = ChildData()
//    init() {
//        let c = ChildData()
//        c.id = 0
//        c.name = "Name"
//        c.surname = "Surname"
//        c.dob = Date()
//        c.health = false
//        c.picture = "default"
//        c.gender = true
//        c.blood = "AB+"
//        self.child = c
//    }
//    static var previews: some View {
//        CellChild(child: child)
//    }
//}

