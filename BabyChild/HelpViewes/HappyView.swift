//
//  HappyView.swift
//  BabyChild
//
//  Created by Mow on 30/10/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI

struct HappyView: View {
    var body: some View {
        VStack{
            Spacer()
            Text("Test Screen").animation(.spring())
            Spacer()
        }
        .frame(minWidth: 0, idealWidth: 1000, maxWidth: .infinity, minHeight: 0, idealHeight: 1000, maxHeight: .infinity, alignment: .center)
    .background(Image("giphy"))
    }
}

struct HappyView_Previews: PreviewProvider {
    static var previews: some View {
        HappyView()
    }
}
