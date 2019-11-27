//
//  SleepView.swift
//  BabyChild
//
//  Created by Mow on 30/10/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI
import Foundation


struct SleepView: View {
    @State var openSleepSheet: Bool = false
    @EnvironmentObject var child: Child
    
    var body: some View {
        VStack{
            Button(action: {
                if !self.child.isSleeping(){
                    self.child.sleep()
                } else {
                self.openSleepSheet.toggle()
                }
            }) {
                RedirectButtonView(name: child.showSleepButton(), info: self.child.showSleepTime())
            }.actionSheet(isPresented: $openSleepSheet) {
                ActionSheet(
                    title: Text("Save sleep time?"),
                    buttons: [
                        .default(Text("Wake up"), action:{self.child.sleep()}),
                        .destructive(Text("Cancel"))
                    ]

                )
            }
            Divider()
            HStack{
                Text("Slept during day")
                Spacer()
                Text("1:23")
            }
            .padding()
            HStack{
                Text("Slept during night")
                Spacer()
                Text("12:32")
            }
            .padding()
        }
         .navigationBarTitle(Text("Sleep"), displayMode: .inline)
        .frame(minWidth: 0,  maxWidth: Screen.width/1.5, minHeight: 0,  maxHeight: .infinity)
        
    }
}

//struct SleepView_Previews: PreviewProvider {
//    static var previews: some View {
//        SleepView()
//    }
//}
