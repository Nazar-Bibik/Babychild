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
    @Binding var activeProfile: Bool
    
    @State var ln: String = "English"
    var languages = ["English", "Bangla"]
    
    
    var body: some View {
        Form {
            Section(header: Text("Language")){
                Picker(selection: $ln, label: Text("Application Language")) {
                    ForEach(0 ..< languages.count) { index in
                        Text(self.languages[index])
                            .tag(self.languages[index])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
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
            HStack{
                Button(action: {
                    withAnimation{
                    self.activeProfile.toggle()
                    }
                }) {Text("Change child profile")}
            }
            Section{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {Text("About UHBaby")}
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {Text("Feedback")}
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {Text("Terms of use")}
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {Text("Privacy policy")}
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {Text("Rate")}.foregroundColor(.green)
            }
        }
    }
}

struct UserSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        UserSettingsView(activeProfile: .constant(true))
    }
}
