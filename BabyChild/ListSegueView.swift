//
//  ListSegueView.swift
//  BabyChild
//
//  Created by Mow on 30/10/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI
import Foundation

// List segues view, comes from Wizard tab
struct ListSegueView: View {
    let tab: MenuItems
    let context: [MenuItems]
    var body: some View {
        List(context, id: \.id) { item in
            NavigationLink(destination: HappyView()) {
                CellModelCapital(name: item.showName(), priority: item.showColor())
            }
        }
        .navigationBarTitle(Text(tab.showName()))
    }
}

//struct ListSegueView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListSegueView()
//    }
//}
