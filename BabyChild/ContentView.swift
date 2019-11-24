//
//  ContentView.swift
//  BabyChild
//
//  Created by Mow on 21/10/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var children = Children()
    
    var body: some View {
        ZStack {
            if (children.current() != nil){
                TabView() {
                    HomeView()
                        .environmentObject(children.current()!)
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
                InitializeView(children: children, new: children.isempty())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
