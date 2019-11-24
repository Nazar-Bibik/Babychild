//
//  InitializeView.swift
//  BabyChild
//
//  Created by Mow on 06/11/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI

struct InitializeView: View {
    @ObservedObject var children: Children
    @State var new: Bool
    
    var body: some View {
        VStack{
            List(self.children.childrenData, id: \.self) {child in
                HStack {
//                    CellChild(child: child)
                    Text(")")
                }
            }.sheet(isPresented: $new) {
                HappyView()
            }
            Button(action: { self.new = true }) {
                Text("New creature")
            }
        }
    }
}

struct InitializeView_Previews: PreviewProvider {
    static var previews: some View {
        InitializeView(children: Children(), new: true)
    }
}
