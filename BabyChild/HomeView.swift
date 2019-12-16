//
//  HomeView.swift
//  BabyChild
//
//  Created by Mow on 24/10/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI


// Home view
struct HomeView: View {
    @EnvironmentObject var child: Child
    @ObservedObject var diaper: DiaperRecord
    @Binding var activeProfile: Bool
    @State var screenHome = Screen.homeList
    
//    @State var sleepButton: String
    
    var body: some View {
        ZStack{
            // Background color
            Color(DataHelper.getHeaderColor())
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                        withAnimation{
                        self.activeProfile.toggle()
                        }
                }
            // Header
        VStack(spacing: 0) {
            HeaderView()
                .environmentObject(child)
            NavigationView{
                // MARK: List of redirect buttons
                List {
                    if (screenHome != 0){
                    Spacer()
                        .frame(height: screenHome)
                    }
                    Group{
                        NavigationLink(destination: SleepView().environmentObject(child)) {
                            RedirectButtonView(name: "Sleep", info: child.showSleepInfo(), background: Color.blue)
                        }
                        NavigationLink(destination: FeedView()) {
                            RedirectButtonView(name: "Feed", info: "Last fed 4:48 h ago", background: Color.green)
                        }
                        NavigationLink(destination: DiaperView(diaper: diaper)) {
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
                .padding(.trailing, -16)
                }
                .navigationBarHidden(true)
                .navigationBarTitle("")
                .padding(.trailing)
                .padding(.leading)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .lineSpacing(0)
        .onDisappear {
//            UITableView.appearance().tableFooterView = UIView()
            // Styling table
            UITableView.appearance().separatorStyle = .singleLine
        }
        .onAppear {
            UITableView.appearance().separatorStyle = .none
        }
            // MARK: redirect rectangle to change curent child
            VStack{
                Rectangle()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 40)
                    .opacity(0.0001)
                    .onTapGesture {
                            withAnimation{
                            self.activeProfile.toggle()
                            }
                    }
                Spacer()
            }
        }
        
        }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(diaper: DiaperRecord(childData: ChildData()), activeProfile: .constant(true))
            .environmentObject(Child(childData: Children().current()))
//        .environmentObject(childArray[0])
    }
}
