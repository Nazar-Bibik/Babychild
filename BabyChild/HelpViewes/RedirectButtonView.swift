//
//  RedirectButtonView.swift
//  BabyChild
//
//  Created by Mow on 02/11/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI

struct RedirectButtonView: View{
    var name: String
    var info: String = ""
    var background: Color
    var action: Int
    var body: some View{
        
        Button(action: {showActionSheet = action}) {
            VStack {
                Text(name)
                    .font(.title)
                if (info != ""){
                    Text(info)
                }
            }
                .frame(minWidth: 0, maxWidth: .infinity)
                .foregroundColor(Color.white)
                .padding(9)
        }
        .background(background)
        .clipShape(Capsule())

    }
}

//struct RedirectButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        RedirectButtonView(name: "Child", info: "Yes", background: .gray, action: false)
//    }
//}
