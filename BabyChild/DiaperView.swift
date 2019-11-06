//
//  DiaperView.swift
//  BabyChild
//
//  Created by Mow on 05/11/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI

struct DiaperView: View {
    var body: some View {
        
        VStack{
            HStack{
                VStack(spacing: 24){
                    RedirectButtonView(name: "Pee")
                    RedirectButtonView(name: "Poo")
                }
                RedirectButtonView(name: "PePo")
            }
            Divider()
            Group{
                HStack{
                    Text("Today")
                    Spacer()
                    Text("3")
                }
                HStack{
                    Text("Solid")
                    Spacer()
                    Text("1")
                }
                HStack{
                    Text("Liquid")
                    Spacer()
                    Text("1")
                }
                HStack{
                    Text("Both")
                    Spacer()
                    Text("1")
                }
            }
            .frame(minWidth: 0,  maxWidth: Screen.width/2)
            .padding(.leading)
            .padding(.trailing)
            .padding(.top)
        }
        .padding()
        .navigationBarTitle(Text("Sleep"), displayMode: .inline)
        
    }
}

struct DiaperView_Previews: PreviewProvider {
    static var previews: some View {
        DiaperView()
    }
}
