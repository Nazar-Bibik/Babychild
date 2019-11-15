//
//  CellChild.swift
//  BabyChild
//
//  Created by Mow on 11/11/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI

struct CellChild: View {
    @State var name: String
    @State var photo: Image
    @State var info: String
    
    var body: some View {
        HStack(spacing: 24) {
            photo
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipped()
                .clipShape(Circle())
                .shadow(color: .secondary, radius: 6)
            VStack(alignment: .leading){
            Text(name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(info)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct CellChild_Previews: PreviewProvider {
    static var previews: some View {
        CellChild(name: "Kiddo", photo: Image("test"), info: "None")
    }
}
