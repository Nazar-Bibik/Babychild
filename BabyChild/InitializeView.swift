//
//  InitializeView.swift
//  BabyChild
//
//  Created by Mow on 06/11/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI
import CoreData
import Foundation

struct InitializeView: View {
    var child: FetchedResults<Child>
    var children: FetchedResults<Child>
    @State var add: Bool = false
    
    var body: some View {
        VStack{
            ForEach(self.children) { oneChild in
                Button(action: {
                    DataHelper.recordChild(id: oneChild.id)
                }) {
                    CellChild(name: oneChild.showName(), photo: oneChild.showPicture(), info: oneChild.showSleepInfo())
                }
            }
            Button(action: {
                self.add.toggle()
            }) {
                Text("Press me")
            }.sheet(isPresented: $add) {
                CreateChildView(nextId: self.children.count)
            }
        }
    }
}

//struct InitializeView_Previews: PreviewProvider {
//    static var previews: some View {
//        InitializeView()
//    }
//}
