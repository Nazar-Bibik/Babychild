//
//  PicturesView.swift
//  BabyChild
//
//  Created by Nazar on 16/12/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI

struct PicturesView: View {
    @ObservedObject var memories: Memories
    @State var album: Album
    
    @State var caption: String = ""
    @State var picture: UIImage? = nil
    @State var newPicture: Bool = false
    @State var pictureSheet: Bool = false
    @State var deleteSheet: Bool = false
    
    var body: some View {
        ZStack{
            ScrollView(.vertical){
                ForEach(album.pictures!.allObjects.map { ($0 as! Media) }, id: \.self){ media in
                    ZStack{
                        TC.DataToImage(data: media.image!).resizable().scaledToFit()
                        if media.caption != nil && media.caption! != ""{
                            VStack{
                                Spacer()
                                EffectView()
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 40)
                            }
                            VStack{
                                Spacer()
                                Text(media.caption!).foregroundColor(.white)
//                                EffectText(labelText: media.caption!)
                            }
                        }
                    }
                }
            }
            VStack{
                Spacer()
                HStack{
                    Button(action: {self.pictureSheet.toggle()}){
                        Text("Add picture")
                    }
                    .sheet(isPresented: $pictureSheet,
                    onDismiss: {
                        if ImagePicker.shared.image != nil {
                            _ = self.memories.addPicture(picture: ImagePicker.shared.image!, album: self.album)
                        }
                    }, content: {
                       ImagePicker.shared.view
                    })
                    
                    Spacer()
                    
                    Button(action: {self.deleteSheet.toggle()}){
                        Text("Delete album")
                    }
                    .actionSheet(isPresented: $deleteSheet) {
                        ActionSheet(
                            title: Text("Are you sure you want to delete the album?"),
                            buttons: [
                                .default(Text("Delete album and all pictures inside"), action:{self.memories.deleteAlbum(album: self.album)}),
                                .destructive(Text("Cancel"))
                            ]
                        )}
                }.padding()
            }
            
            if newPicture{
                EffectView(customEffect: UIBlurEffect(style: .regular))
                    .transition(.opacity)
                    .onTapGesture {
                        self.newPicture.toggle()
                }
                VStack{
                    TextField("Image caption (optional)", text: $caption).padding().background(Color.white).cornerRadius(8)
                    Button(action: {}) {
                        Text("Select image")
                    }
                    .sheet(isPresented: $pictureSheet,
                    onDismiss: {
                        if ImagePicker.shared.image != nil {
                            self.picture = ImagePicker.shared.image!
                        }
                    }, content: {
                       ImagePicker.shared.view
                    })
                    Button(action: {}){
                        Text("Save image")
                    }
                    Button(action: {self.newPicture.toggle()}){
                        Text("Cancel")
                    }
                    
                }.padding()
                    .transition(.slide)
                    .gesture(DragGesture().onEnded { value in
                        self.newPicture.toggle()
                    })
            }
            
        }
    }
}

//struct PicturesView_Previews: PreviewProvider {
//    static var previews: some View {
//        PicturesView()
//    }
//}
