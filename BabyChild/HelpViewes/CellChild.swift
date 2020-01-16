//
//  CellChild.swift
//  BabyChild
//
//  Created by Mowsumi Rahman on 24/11/2019.
//  Copyright © 2019 Mowsumi Rahman. All rights reserved.
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
