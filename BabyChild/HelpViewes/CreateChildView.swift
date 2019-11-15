//
//  CreateChildView.swift
//  BabyChild
//
//  Created by Mow on 11/11/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI

struct CreateChildView: View {
//    @Binding var add: Bool
    @State private var name: String = ""
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var nextId: Int
    
    var body: some View {
        VStack{
            TextField("Idea title", text: self.$name)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {
                let child = Child(context: self.managedObjectContext)
                child.Name = self.name
                self.nextId += 1
                child.id = self.nextId
                DataHelper.recordChild(id: self.nextId)
                
                do {
                    try self.managedObjectContext.save()
                } catch {
                    print(error)
                }
                
            }) {
                Text("Add")
            }
        }
    }
}

struct CreateChildView_Previews: PreviewProvider {
    static var previews: some View {
        CreateChildView(nextId: 2)
    }
}
