//
//  ContentView.swift
//  BabyChild
//
//  Created by Mow on 21/10/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView() {
            HomeView()
                .environmentObject(childArray[0])
                .tabItem {
                    Text("Home")

            }.tag(1)
            WizardView(context: wizardMenu)
                .tabItem{
                    Text("Wizard")
            }.tag(2)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
