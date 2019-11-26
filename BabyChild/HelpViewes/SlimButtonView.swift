//
//  SlimButtonView.swift
//  BabyChild
//
//  Created by Mow on 26/11/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI

struct SlimButtonView: View {
    @State var name: String
    var background: Color = .gray
    var body: some View{
        
        VStack {
            Text(name)
                .font(.title)
                .colorInvert()
        }
//        .frame(minWidth: 0, maxWidth: .infinity)
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
