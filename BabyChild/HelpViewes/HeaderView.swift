//
//  HeaderView.swift
//  BabyChild
//
//  Created by Mow on 02/11/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var child: Child
    var body: some View{
        
        HStack {
                child.showPicture()
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipped()
                    .clipShape(Circle())
                    .shadow(color: .secondary, radius: 6)
            Text(child.showName())
                    .font(.title)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .aspectRatio(contentMode: .fit)
            Spacer()
                VStack {
                    Group{
                        Text(child.showAgeWeeks() + " weeks")
                        Text(child.showAgeDays() + " days")
                    }
                    .font(.footnote)
                }
            }
        .padding()
        .padding(.top, 20)
        .background(Color("cHeaderBlue"))
        
    }
}
//
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
////