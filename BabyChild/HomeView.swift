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
    @Binding var activeProfile: Bool
    
//    @State var sleepButton: String

    
    var body: some View {
        
        VStack(spacing: 0) {
            HeaderView()
                .environmentObject(child)
                .onTapGesture {
                    withAnimation{
                    self.activeProfile.toggle()
                    }
            }
            NavigationView{
                List {
//                    EmptyView()
//                        .frame(minWidth: 0, maxWidth: .infinity, maxHeight: )
                    NavigationLink(destination: SleepView().environmentObject(child)) {
                        RedirectButtonView(name: "Sleep", info: child.showSleepInfo(), background: Color.blue)
                    }
                    NavigationLink(destination: FeedView()) {
                        RedirectButtonView(name: "Feed", info: child.showFeedInfo(), background: Color.green)
                    }
                    NavigationLink(destination: DiaperView()) {
                        RedirectButtonView(name: "Diaper", background: Color.yellow)
                    }
                    NavigationLink(destination: HappyView()) {
                        RedirectButtonView(name: "Entertainment", background: Color.orange)
                    }
                    NavigationLink(destination: HappyView()) {
                        RedirectButtonView(name: "Health", background: Color.red)
                    }
                    NavigationLink(destination: HappyView()) {
                        RedirectButtonView(name: "Notes", background: Color.purple)
                    }
                }
                .navigationBarHidden(true)
                .navigationBarTitle("")
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                .padding(.trailing, -16)
                .padding(.trailing)
                .padding(.leading)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .edgesIgnoringSafeArea(.top)
        .lineSpacing(0)
        .onDisappear {
            // To remove only extra separators below the list:
//            UITableView.appearance().tableFooterView = UIView()
            // To remove all separators including the actual ones:
            UITableView.appearance().separatorStyle = .singleLine
        }
        .onAppear {
            UITableView.appearance().separatorStyle = .none
        }
        }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(activeProfile: .constant(true))
            .environmentObject(Child(childData: Children().current()))
//        .environmentObject(childArray[0])
    }
}
