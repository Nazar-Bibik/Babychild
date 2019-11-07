//
//  SleepView.swift
//  BabyChild
//
//  Created by Mow on 30/10/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI
import Foundation

struct SleepRecordView: View{
    @EnvironmentObject var child: Child
    
    var body: some View{
        VStack{
            Button(action: {}) {
                RedirectButtonView(name: "Sleep")
            }
        }
    }
}

struct SleepView: View {
    @State var openSleepSheet: Bool = false
    @EnvironmentObject var child: Child
    
    var body: some View {
        VStack{
            Button(action: {
                self.openSleepSheet.toggle()
            }) {
                RedirectButtonView(name: "yes", info: "yes")
            }
            .sheet(isPresented: $openSleepSheet) {
                SleepRecordView().environmentObject(self.child)
            }
            Divider()
            HStack{
                Text("Slept during day")
                Spacer()
                Text("00:00:00")
            }
            .padding()
            HStack{
                Text("Slept during night")
                Spacer()
                Text("00:00:00")
            }
            .padding()
        }
         .navigationBarTitle(Text("Sleep"), displayMode: .inline)
        .frame(minWidth: 0,  maxWidth: Screen.width/1.5, minHeight: 0,  maxHeight: .infinity)
        
    }
}

struct SleepView_Previews: PreviewProvider {
    static var previews: some View {
        SleepRecordView()
    }
}
