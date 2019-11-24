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
            ScrollView {
                List {
                    /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Content@*/Text("Content")/*@END_MENU_TOKEN@*/
                }
            }
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
