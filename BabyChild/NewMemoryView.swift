//
//  NewMemoryView.swift
//  BabyChild
//
//  Created by Nazar on 16/12/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI

struct NewMemoryView: View {
    @State var title: String = ""
    @State var time: Date = Date()
    @State var picture: UIImage? = nil
    @State var timenote: String = ""
    @State var pictureSheet: Bool = false
    
    @ObservedObject var memories: Memories
    @Binding var newMemory: Bool
    
    var body: some View {
        VStack{
            Group{
                VStack(spacing: 0){
                    TextField("Album title", text: $title).padding([.trailing, .leading]).padding([.top, .bottom], 6)
                    HStack{
                        VStack{Divider()}.padding([.trailing, .leading])
                        Text("and / or")
                        VStack{Divider()}.padding([.trailing, .leading])
                    }
                    TextField("Note title: " + memoryTitle, text: $timenote).padding([.trailing, .leading]).padding([.top, .bottom], 6)
                }
                
                DatePicker(selection: $time, displayedComponents: .date, label: { EmptyView() })
                
                Button(action: {self.pictureSheet.toggle()}) {
                    if picture == nil{
                        Text("Pick an image").padding()
                    } else {
                        Text("Change an image").padding().background(Image(uiImage: picture!).renderingMode(.original).resizable().scaledToFill()).cornerRadius(8)
                    }
                }.sheet(isPresented: $pictureSheet,
                onDismiss: {
                    if ImagePicker.shared.image != nil {
                        self.picture = ImagePicker.shared.image!
                    }
                }, content: {
                   ImagePicker.shared.view
                })
                
//                    if picture != nil{
//                        Image(uiImage: picture!).resizable().scaledToFill().frame(height: 60).clipped()
//                    }
            }.background(Color.white).cornerRadius(8)
            
            Divider().hidden()
            Button(action: {
                if self.memories.addMemory(title: self.title, time: self.time, picture: self.picture, notename: self.title, notetime: self.time, timenote: self.timenote){
                    self.newMemory.toggle()
                }
            }){
                SlimButtonView(name: "Save the memory", background: .green)
            }.background(Color.clear)
        }.padding()
    }
}

//struct NewMemoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewMemoryView(memories: Memories(childid: 0))
//    }
//}
