//
//  HomeView.swift
//  BabyChild
//
//  Created by Mow on 24/10/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI
// VIEW FOR A HEADER IN HOME
struct Header: View {
    @EnvironmentObject var child: Child
    var body: some View{
        HStack {
                child.showPicture()
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipped()
                    .clipShape(Circle())
                    .shadow(color: .secondary, radius: 6)
                Text("Oishy")
                    .font(.title)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .aspectRatio(contentMode: .fit)
            Spacer()
                VStack {
                    Group{
                        Text(child.showAgeWeeks() + " weeks")
                        Text(child.showAgeDays() + " days")
                    }
                    .font(.footnote)
                }
            }
        .padding()
        .padding(.top, 12)
        .background(Color("cHeaderBlue"))
    }
}

//VIEW FOR A MAIN PART OF HOME
struct RedirectButton: View{
    var name: String
    var info: String = ""
    var background: Color
    var body: some View{
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
            VStack {
                Text(name)
                    .font(.title)
                if (info != ""){
                    Text(info)
                }
            }
                .frame(minWidth: 0, maxWidth: .infinity)
                .foregroundColor(Color.white)
                .padding(9)
        }
        .background(background)
        .clipShape(Capsule())
    }
}


struct HomeView: View {
    @EnvironmentObject var child: Child
    var body: some View {
        VStack(spacing: 0) {
            Header()
                .environmentObject(child)
            ScrollView(showsIndicators: false) {
                VStack(spacing: 32) {
                    RedirectButton(name: "Sleep", info: "Information", background: Color.orange)
                    RedirectButton(name: "Feed", info: "Info", background: Color.green)
                    RedirectButton(name: "Change", background: Color.yellow)
                    RedirectButton(name: "Entertainment", background: Color.purple)
                    RedirectButton(name: "Health", background: Color.red)
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
