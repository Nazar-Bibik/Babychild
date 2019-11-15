//
//  ContentView.swift
//  BabyChild
//
//  Created by Mow on 21/10/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Child.childCheckRequest(id: DataHelper.fetchChild())) var child: FetchedResults<Child>
    @State var main: Int = DataHelper.fetchChild()
    @FetchRequest(fetchRequest: Child.childFetchRequest()) var children: FetchedResults<Child>
    
    
    var body: some View {
        ZStack {
            if (child.count != 0){
                TabView() {
                    HomeView()
                        .tabItem {
                            Text("Home")

                    }.tag(1)
                    WizardView(context: wizardMenu)
                        .tabItem{
                            Text("Wizard")
                    }.tag(2)
                }
                .edgesIgnoringSafeArea(.top)
            } else {
                InitializeView(child: child, children: children)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
