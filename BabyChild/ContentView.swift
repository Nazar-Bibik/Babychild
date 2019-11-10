//
//  ContentView.swift
//  BabyChild
//
//  Created by Mow on 21/10/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var child: Child
    @State var main: Int = DataHelper.fetchChild()
    
    init(){
        child = DataHelper.getChild()[1]
    }
    
    var body: some View {
        ZStack {
            if (main != -1){
                TabView() {
                    HomeView()
                        .environmentObject(child)
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
                InitializeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
