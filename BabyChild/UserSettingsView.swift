//
//  UserSettingsView.swift
//  BabyChild
//
//  Created by Mow on 26/11/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI

struct UserSettingsView: View {
    var colors = DataHelper.colors
    @State var color = DataHelper.getHeaderColor()
    
    
    var body: some View {
        Form {
            Section(header: Text("Colours")){
                VStack{
                    HStack{
                        ForEach(0 ..< colors.count) { index in
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height:27)
                                .foregroundColor(Color(self.colors[index]))
                                .onTapGesture {
                                    self.color = self.colors[index]
                                    DataHelper.setHeaderColor(name: self.colors[index])
                            }
                        }
                    }
                    RoundedRectangle(cornerRadius: 5)
                        .frame(height: 7)
                    .foregroundColor(Color(color))
                }
            }
        }
    }
}

struct UserSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        UserSettingsView()
    }
}
