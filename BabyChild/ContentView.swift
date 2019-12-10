//
//  ContentView.swift
//  BabyChild
//
//  Created by Mow on 21/10/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var child: Child
    @ObservedObject var children = Children()
    @State var activeProfile: Bool = true
    
    
    var body: some View {
        ZStack {
            if (children.current() != nil && activeProfile){
                TabView() {
                    HomeView(diaper: DiaperRecord(childData: child.childData), activeProfile: $activeProfile)
                        .tabItem {
                            Image(systemName: "house")
                            Text("Home")

                    }.tag(1)
                    WizardView(context: wizardMenu)
                        .tabItem{
                            Image(systemName: "wand.and.stars")
                            Text("Wizard")
                    }.tag(2)
                    MemoriesView()
                        .tabItem{
                            Image(systemName: "camera")
                            
                            Text("Memories")
                    }.tag(4)
                    MotherView()
                        .tabItem{
                            Image(systemName: "m.square")
                            Text("Mother")
                    }.tag(5)
                    UserSettingsView()
                        .tabItem{
                            Image(systemName: "gear")
                            Text("Settings")
                    }.tag(3)
                }
                .edgesIgnoringSafeArea(.top)
            } else {
                InitializeView(children: children, activeProfile: $activeProfile, new: children.isempty())
            }
        }.transition(.opacity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
