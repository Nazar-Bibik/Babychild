//
//  Wizard.swift
//  BabyChild
//
//  Created by Mow on 26/10/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI
import Foundation
import UIKit

struct Wizard: View {
    let context: [MenuItems]
    var body: some View {
        NavigationView{
        List(context, id: \.id) { item in
            if (item.id != 1) {
                CellModelCapital(name: item.showName(), priority: item.showColor())
                
            }
            else {
                NavigationLink(destination: Wizard(context: wizardMenuSegue)) {
                    CellModelCapital(name: item.showName(), priority: item.showColor())
                }
            }
        }
        .navigationBarTitle(Text("All in One"))
        }
    }
}

struct Wizard_Previews: PreviewProvider {
    static var previews: some View {
        Wizard(context: wizardMenu)
    }
}
