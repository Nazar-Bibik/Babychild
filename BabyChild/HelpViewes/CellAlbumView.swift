//
//  CellAlbumView.swift
//  BabyChild
//
//  Created by Nazar on 15/12/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI

struct CellAlbumView: View {
    @State var album: Album
    var images: [Image]
    
    var body: some View {
        VStack(spacing: 4){
            if album.title != ""{
                HStack{
                    Text(album.title!)
                        .font(.title)
                        .fontWeight(.semibold)
                        .lineLimit(1)
                        .foregroundColor(Color(UIColor.label))
                    Spacer()
                }
            }
            ZStack{
                if images.count == 0{
                    Image("default2").renderingMode(.original).resizable().scaledToFill().frame(height: 120).clipped().cornerRadius(12)
                } else if images.count == 1{
                    images.first!.renderingMode(.original).resizable().scaledToFill().frame(height: 120).clipped().cornerRadius(12)
                } else if images.count == 2{
                    HStack{
                        Spacer()
                        images[0].renderingMode(.original).resizable().scaledToFill().frame(width: Screen.width/1.5, height: 120).clipped().cornerRadius(12).shadow(color: .secondary, radius: 2, x: 2, y: 0)
                    }
                    HStack{
                        images[1].renderingMode(.original).resizable().scaledToFill().frame(width: Screen.width/1.5, height: 120).clipped().cornerRadius(12).shadow(color: .secondary, radius: 2, x: 2, y: 0)
                        Spacer()
                    }
                } else {
                    HStack{
                        Spacer()
                        images[0].renderingMode(.original).resizable().scaledToFill().frame(width: Screen.width/2, height: 120).clipped().cornerRadius(12).shadow(color: .secondary, radius: 2, x: 2, y: 0)
                    }
                    HStack{
                        Spacer()
                        images[1].renderingMode(.original).resizable().scaledToFill().frame(width: Screen.width/2, height: 120).clipped().cornerRadius(12).shadow(color: .secondary, radius: 2, x: 2, y: 0)
                        Spacer()
                    }
                    HStack{
                        images[2].renderingMode(.original).resizable().scaledToFill().frame(width: Screen.width/2, height: 120).clipped().cornerRadius(12).shadow(color: .secondary, radius: 2, x: 2, y: 0)
                        Spacer()
                    }
                }
                VStack{
                    Spacer()
                    EffectView()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 20)
                }
                VStack{
                    Spacer()
                    HStack{
                        Text(DateHelper.showDate(datetime: album.time!))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                    }.padding([.leading, .trailing])
                }
                }.frame(height: 120).cornerRadius(12).clipped()
        }.padding().cornerRadius(12)
    }
}

struct CellAlbumView_Previews: PreviewProvider {
    static var previews: some View {
        CellAlbumView(album: Album(), images: [])
    }
}

struct EffectView: UIViewRepresentable {
    let blurEffect: UIBlurEffect = UIBlurEffect(style: .regular)
    var customEffect: UIBlurEffect?

    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView {
        UIVisualEffectView()
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) {
        if customEffect != nil{
            uiView.effect = customEffect
        } else {
            uiView.effect = blurEffect
        }
    }
}

//struct EffectText: UIViewRepresentable {
//        var customEffect: UIBlurEffect?
//        var labelText: String?
//
//        func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView {
//            UIVisualEffectView()
//        }
//        
//        func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) {
//            if customEffect != nil{
//                uiView.effect = UIVibrancyEffect(blurEffect: customEffect!)
//            } else {
//                uiView.effect = UIVibrancyEffect(blurEffect: UIBlurEffect(style: .regular))
//            }
//
//            uiView.translatesAutoresizingMaskIntoConstraints = false
//            let label: UILabel = UILabel()
//            label.translatesAutoresizingMaskIntoConstraints = false
//            label.text = labelText == nil ? "Empty" : labelText!
//            label.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
//            label.textAlignment = .center
//            label.textColor = UIColor.white
//            uiView.contentView.addSubview(label)
//            
//            uiView.addConstraint(NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: uiView, attribute: .centerX, multiplier: 1.0, constant: 0))
//            uiView.addConstraint(NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: uiView, attribute: .centerY, multiplier: 1.0, constant: 0))
//        }
//}
