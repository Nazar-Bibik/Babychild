//
//  DiaperView.swift
//  BabyChild
//
//  Created by Mow on 05/11/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI

// View to display and create diaper records
struct DiaperView: View {
    @ObservedObject var diaper: DiaperRecord
    
    
    var body: some View {
        
        VStack(spacing: 0){
            HStack{
                VStack(spacing: 24){
                    Button(action: {self.diaper.newRecord(type: 0)}) {
                        RedirectButtonView(name: "Liquid")
                    }
                    Button(action: {self.diaper.newRecord(type: 1)}) {
                        RedirectButtonView(name: "Solid")
                    }
                }
                Button(action: {self.diaper.newRecord(type: 2)}) {
                    RedirectButtonView(name: "Both")
                }
            }.padding()
            Divider().padding([.leading, .trailing])
            ScrollView {
//                List(diaper.diaperEvents, id: \.childid) { item in
                ForEach(self.diaper.diaperEvents, id: \.self) {item in
                    HStack{
                        Spacer()
                        SlimButtonView(name: self.diaper.showTime(item: item))
                        .font(.system(size: 14, design: .monospaced))
                        Spacer()
                        Text(self.diaper.showType(item: item))
                            .font(.title)
                        Spacer()
                        }.padding([.top, .trailing, .leading])
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            }
        }
        .navigationBarTitle(Text("Diaper"), displayMode: .inline)
        
    }
}

struct DiaperView_Previews: PreviewProvider {
    static var previews: some View {
        DiaperView(diaper: DiaperRecord(childData: ChildData()))
    }
}
