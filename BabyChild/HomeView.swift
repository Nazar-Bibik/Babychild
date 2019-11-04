//
//  HomeView.swift
//  BabyChild
//
//  Created by Mow on 24/10/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI



struct HomeView: View {
    @EnvironmentObject var child: Child
    @EnvironmentObject var showActionSheet:Int? = nil
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView()
                .environmentObject(child)
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    
                    RedirectButtonView(name: "Sleep", info: "Information", background: Color.orange, action: showActionSheet)
                    RedirectButtonView(name: "Feed", info: "Info", background: Color.green, action: showActionSheet)
                    RedirectButtonView(name: "Change", background: Color.yellow, action: showActionSheet)
                    RedirectButtonView(name: "Entertainment", background: Color.purple, action: showActionSheet)
                    RedirectButtonView(name: "Health", background: Color.red, action: showActionSheet)
                    
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .padding()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .edgesIgnoringSafeArea(.top)
        .lineSpacing(0)
        }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        .environmentObject(childArray[0])
    }
}
