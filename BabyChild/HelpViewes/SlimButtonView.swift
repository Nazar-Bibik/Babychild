//
//  SlimButtonView.swift
//  BabyChild
//
//  Created by Mowsumi Rahman on 26/11/2019.
//  Copyright © 2019 Mowsumi Rahman. All rights reserved.
//

import SwiftUI

// Redirect Button but slim
struct SlimButtonView: View {
    @State var name: String
    var background: Color = .gray
    var body: some View{
        
        VStack {
            Text(name)
                .font(.title)
                .colorInvert()
        }
        .padding(3)
        .padding(.leading, 24)
        .padding(.trailing, 24)
        .background(background)
        .clipShape(Capsule())
        .foregroundColor(Color(.label))
    }
}

struct SlimButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SlimButtonView(name: "Test text")
    }
}
