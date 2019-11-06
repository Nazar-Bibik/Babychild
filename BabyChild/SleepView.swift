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
    @EnvironmentObject var sleep: Sleep
    @EnvironmentObject var child: Child
    @EnvironmentObject var clock: Clock
    
    var body: some View {
        VStack{
            Button(action: {
//                self.openSleepSheet.toggle()
                self.sleep.toggle()
                self.child.sleep(sleeping: self.sleep.isSleeping)
            }) {
                RedirectButtonView(name: sleep.showButton(), info: sleep.showTime())
            }
//            .sheet(isPresented: $openSleepSheet) {
//                Text("Test")
//            }
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
        SleepView()
    }
}
