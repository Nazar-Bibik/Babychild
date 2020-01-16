//
//  CellModelCapital.swift
//  BabyChild
//
//  Created by Mowsumi Rahman on 30/10/2019.
//  Copyright © 2019 Mowsumi Rahman. All rights reserved.
//

import Foundation
import SwiftUI

// List cell with capital coloured letter
struct CellModelCapital: View {
    let name: String
    var priority: Color = .gray
    var body: some View{
        HStack(alignment: .firstTextBaseline ,spacing: 0) {
            Text(String(name.first!))
                .font(.title)
                .fontWeight(.heavy)
                .multilineTextAlignment(.leading)
                .foregroundColor(priority)
            Text(name.dropFirst())
                .fontWeight(.heavy)
            Spacer()
        }
        .padding(6)
    }
}


struct CellModelCapital_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            CellModelCapital(name: "Important", priority: .red)
            CellModelCapital(name: "Not so important", priority: .blue)
            CellModelCapital(name: "Others", priority: .green)
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
