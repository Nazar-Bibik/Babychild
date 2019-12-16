//
//  WizardView.swift
//  BabyChild
//
//  Created by Mow on 30/10/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI
import Foundation
import UIKit

//WIzard tab, redirects to ListSegueView
struct WizardView: View {
    @State var titleText: String = "Wizard"
    let context: [MenuItems]
    var body: some View {
        NavigationView{
        List(context, id: \.id) { item in
            if (item.id != 1) {
                CellModelCapital(name: item.showName(), priority: item.showColor())
                
            }
            else {
                NavigationLink(destination: ListSegueView(tab: item, context: wizardMenuSegue)) {
                    CellModelCapital(name: item.showName(), priority: item.showColor())
                }
            }
        }
        .navigationBarTitle(Text(titleText))
        }
    }
}

struct Wizard_Previews: PreviewProvider {
    static var previews: some View {
        WizardView(context: wizardMenu)
    }
}
