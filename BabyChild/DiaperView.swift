//
//  DiaperView.swift
//  BabyChild
//
//  Created by Mow on 05/11/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI

struct DiaperView: View {
    @ObservedObject var diaper: DiaperRecord
    
    
    var body: some View {
        
        VStack{
            HStack{
                VStack(spacing: 24){
                    Button(action: {self.diaper.newRecord(type: 0)}) {
                        RedirectButtonView(name: "Pee")
                    }
                    Button(action: {self.diaper.newRecord(type: 1)}) {
                        RedirectButtonView(name: "Poo")
                    }
                }
                Button(action: {self.diaper.newRecord(type: 2)}) {
                    RedirectButtonView(name: "PePo")
                }
            }
            Divider()
            ScrollView {
//                List(diaper.diaperEvents, id: \.childid) { item in
                ForEach(self.diaper.diaperEvents, id: \.self) {item in
                    HStack{
                        SlimButtonView(name: self.diaper.showTime(item: item))
                        .font(.system(size: 14, design: .monospaced))
                        Spacer()
                        Text(self.diaper.showType(item: item))
                            .font(.title)
                        Spacer()
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            }
        }
        .padding()
        .navigationBarTitle(Text("Diaper"), displayMode: .inline)
        
    }
}

struct DiaperView_Previews: PreviewProvider {
    static var previews: some View {
        DiaperView(diaper: DiaperRecord(childData: ChildData()))
    }
}
