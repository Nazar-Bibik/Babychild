//
//  MemoriesView.swift
//  BabyChild
//
//  Created by Mow on 04/12/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI

struct MemoriesView: View {
    @State var newMemory: Bool = false
    
    @ObservedObject var memories: Memories
    @EnvironmentObject var child: Child
    
    var body: some View {
        NavigationView{
            ZStack{
                ScrollView(.vertical, showsIndicators: false){
                    
                    // Display recent album on top
                    if memories.albums.count != 0 && memories.albums.first!.pictures?.allObjects.count != 0{
                        ZStack{
                            EffectView(customEffect: UIBlurEffect(style: .dark)).frame(height: 180)
                                .background(DataHelper.getThumbnailsFromAlbum(album: memories.albums.first!)[0]
                                .resizable()
                                .scaledToFill())
                                .clipped()
                                .cornerRadius(12)
//                            EffectText(labelText: memories.albums.first!.title!)
                            Text(memories.albums.first!.title!).foregroundColor(.white).opacity(0.75)
                        }
                    }
                    
                    // Display recent note memos -> segue to MemoNotesView
                    if memories.notes.count != 0 {
                        NavigationLink(destination: MemoNotesView(notes: memories.notes)) {
                        VStack{
                            Text(child.showName() + "'s " + memories.notes.first!.name!)
                                .font(.headline)
                            Text(DateHelper.showDate(datetime: memories.notes.first!.time!))
                                .fontWeight(.light)
                            }.frame(minWidth: 0, maxWidth: .infinity).padding().background(Color(DataHelper.getHeaderColor())).cornerRadius(12).shadow(color: .secondary, radius: 1, x: 0, y: 1)
                        }.foregroundColor(Color(UIColor.label))
                    }
                    
                    Divider().hidden()
                    Button(action: {
                        withAnimation{
                            self.newMemory.toggle()
                        }
                    }){
                        SlimButtonView(name: "Make a new memory")
                    }
                    
                    // Display albums -> Segue to PicturesView
                    ForEach(memories.albums, id: \.self) { album in
                        NavigationLink(destination: PicturesView(memories: self.memories, album: album)){
                            CellAlbumView(album: album, images: DataHelper.getThumbnailsFromAlbum(album: album))
                        }
                    }
                }.padding([.leading, .trailing])
                
                // MARK: Creating new memory
                // Memory creator, combines visual effect and NewMemoryView
                if newMemory{
                    EffectView(customEffect: UIBlurEffect(style: .dark))
                        .transition(.opacity)
                        .onTapGesture {
                            self.newMemory.toggle()
                    }
                    NewMemoryView(memories: memories, newMemory: $newMemory)
                        .transition(.slide)
                        .gesture(DragGesture().onEnded { value in
                            self.newMemory.toggle()
                        })

                }
                
            }
            .navigationBarTitle("Memories", displayMode: .inline)
            
        }
    }
}

struct MemoriesView_Previews: PreviewProvider {
    static var previews: some View {
        MemoriesView(memories: Memories(childid: 0))
    }
}
