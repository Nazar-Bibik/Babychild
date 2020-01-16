//
//  RedirectButtonView.swift
//  BabyChild
//
//  Created by Mowsumi Rahman on 02/11/2019.
//  Copyright © 2019 Mowsumi Rahman. All rights reserved.
//

import SwiftUI

// Styled button with text and colour
struct RedirectButtonView: View{
    var name: String
    var info: String = ""
    var background: Color = .blue
    var body: some View{
        
        VStack {
            Text(name)
                .font(.title)
                .colorInvert()
            if (info != ""){
                Text(info)
                    .colorInvert()
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding(9)
        .background(background)
        .clipShape(Capsule())
        .foregroundColor(Color(.label))
    }
}

struct RedirectButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            RedirectButtonView(name: "Record", info: "Yes")
            RedirectButtonView(name: "Not Child", background: .red)
            RedirectButtonView(name: "Another test", info: "Bottom text", background: Color("cHeaderBlue"))
        }
        .previewLayout(.fixed(width: 250, height: 120))
    }
}
