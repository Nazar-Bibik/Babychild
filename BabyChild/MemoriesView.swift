//
//  MemoriesView.swift
//  BabyChild
//
//  Created by Mow on 04/12/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI

struct MemoriesView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            HStack{
                Text("Most important memories")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Spacer()
            }.padding(.bottom, 32)
            VStack{
                HStack{
                    Text("Photos")
                        .font(.title)
                    Spacer()
                }
                ZStack{
                    HStack{
                        Spacer()
                        Image("d5").frame(width: Screen.width/2, height: 120).clipped().cornerRadius(12).shadow(color: .secondary, radius: 2, x: 2, y: 0)
                    }
                    HStack{
                        Spacer()
                        Image("test").frame(width: Screen.width/2, height: 120).clipped().cornerRadius(12).shadow(color: .secondary, radius: 2, x: 2, y: 0)
                        Spacer()
                    }
                    HStack{
                        Image("d1").frame(width: Screen.width/2, height: 120).clipped().cornerRadius(12).shadow(color: .secondary, radius: 2, x: 2, y: 0)
                        Spacer()
                    }
                }.frame(height: 120)
            }.padding().cornerRadius(12)
            
            VStack{
                Text("Jame's first word - mama")
                    .font(.headline)
                Text("Nov 23, 2019, 15:23")
                    .fontWeight(.light)
                }.frame(minWidth: 0, maxWidth: .infinity).padding().background(Color(DataHelper.getHeaderColor())).cornerRadius(12).shadow(color: .secondary, radius: 1, x: 0, y: 1)
            
            VStack{
                HStack{
                    Text("Sleepin")
                        .font(.title)
                    Spacer()
                }
                ZStack{
                    HStack{
                        Spacer()
                        Image("s1").scaledToFit().frame(width: Screen.width/2, height: 120).clipped().cornerRadius(12).shadow(color: .secondary, radius: 2, x: 2, y: 0)
                    }
                    HStack{
                        Spacer()
                        Image("s2").scaledToFit().frame(width: Screen.width/2, height: 120).clipped().cornerRadius(12).shadow(color: .secondary, radius: 2, x: 2, y: 0)
                        Spacer()
                    }
                    HStack{
                        Image("s3").scaledToFit().frame(width: Screen.width/2, height: 120).clipped().cornerRadius(12).shadow(color: .secondary, radius: 2, x: 2, y: 0)
                        Spacer()
                    }
                }.frame(height: 120)
            }.padding().cornerRadius(12)
            
            VStack{
                HStack{
                    Text("Happy photos")
                        .font(.title)
                    Spacer()
                }
                ZStack{
                    HStack{
                        Spacer()
                        Image("r1").scaledToFit().frame(width: Screen.width/2, height: 120).clipped().cornerRadius(12).shadow(color: .secondary, radius: 2, x: 2, y: 0)
                    }
                    HStack{
                        Spacer()
                        Image("r2").scaledToFit().frame(width: Screen.width/2, height: 120).clipped().cornerRadius(12).shadow(color: .secondary, radius: 2, x: 2, y: 0)
                        Spacer()
                    }
                    HStack{
                        Image("r3").scaledToFit().frame(width: Screen.width/2, height: 120).clipped().cornerRadius(12).shadow(color: .secondary, radius: 2, x: 2, y: 0)
                        Spacer()
                    }
                }.frame(height: 120)
            }.padding().cornerRadius(12)
        }.padding([.leading, .trailing])
    }
}

struct MemoriesView_Previews: PreviewProvider {
    static var previews: some View {
        MemoriesView()
    }
}
