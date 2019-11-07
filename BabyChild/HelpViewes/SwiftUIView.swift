//
//  SwiftUIView.swift
//  BabyChild
//
//  Created by Mow on 02/11/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI

struct SwiftUIView: View {
    @State var selection: Int? = nil
    @State private var action: Int? = 0
    @State var showView = false

    
//    var body: some View {
//        NavigationView {
//            VStack {
//                Button("Press me") {
//                    self.selection = 2
//                }
//                Button(action: {self.selection = 1}) {
//                    Text("Press me 3")
//                }
//                NavigationLink(destination: HappyView(), tag: 2, selection: $selection) {
//                    EmptyView()
//                }
//                NavigationLink(destination: SleepView(), tag: 1, selection: $selection) {
//                    EmptyView()
//                }
//            }
//        }
        

//            NavigationView {
//                        VStack {
//                            NavigationLink(destination: Text("Destination"), tag: 1, selection: $action) {
//                                EmptyView()
//                            }
//                            NavigationLink(destination: HappyView(), isActive: $showView) {
//                                EmptyView()
//                            }
//
//                            Text("Your Custom View")
//                                .onTapGesture {
//                     //perform some tasks if needed before opening Destination view
//                                    self.action = 1
//                            }
//                            Button(action: {self.showView = true}) {
//                                Text("Press me 3")
//                            }
//                        }
//                    }
            
        var body: some View {
            Button(action: {}) {
                Text("Button")
            }.sheet(isPresented: $showView) {
            Text("++")
            }
    }
    
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
