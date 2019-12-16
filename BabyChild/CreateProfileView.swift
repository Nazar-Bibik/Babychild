//
//  CreateProfileView.swift
//  BabyChild
//
//  Created by Mow on 24/11/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI

struct CreateProfileView: View {
    @EnvironmentObject var child: Child
    @ObservedObject var children: Children
    @Binding var new: Bool
    @State var pictureSheet: Bool = false
    
    @State var name: String = ""
    @State var surname: String = ""
    @State var dob: Date = Date() + 3600
    @State var health: Bool = true
    @State var picture: UIImage? = nil
    @State var gender: Bool? = nil
    @State var blood: String = ""
    var bloodtypes = ["AB", "AB+", "A", "A+", "B", "B+", "O", "O+"]
    
    var body: some View {
        NavigationView{
        Form{
            Text("A new profile for: " + name)
                .fontWeight(.semibold)
            TextField("Name", text: $name)
            TextField("Surname", text: $surname)
            
            Button(action: {self.pictureSheet.toggle()}) {
                Text("Add photo")
            }.sheet(isPresented: $pictureSheet,
            onDismiss: {
                if ImagePicker.shared.image != nil {
                    self.picture = ImagePicker.shared.image!
                }
            }, content: {
               ImagePicker.shared.view
            })
            Section{
                VStack(spacing: 6){
                    Text("Gender")
                        .font(.headline)
                    HStack {
                        Spacer()
                        SlimButtonView(name: "Boy", background: gender ?? false ? Color("boy") : .gray)
                            .onTapGesture {
                                self.gender = true
                        }
                        Spacer()
                        SlimButtonView(name: "Girl", background: gender ?? true ? .gray : Color("girl"))
                            .onTapGesture {
                                self.gender = false
                        }
                        Spacer()
                    }
                }
                DatePicker("Date of birth", selection: $dob)
            }
            
            Section{
                VStack{
                    Text("Blood type")
                        .font(.headline)
                    Picker(selection: $blood, label: Text("Blood type")) {
                        ForEach(0 ..< bloodtypes.count) { index in
                            Text(self.bloodtypes[index])
                                .tag(self.bloodtypes[index])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
//                Toggle(isOn: $health) {
//                    Text("Show health bar")
//                }
            }

            Button(action: {
                if self.children.add(name: self.name, surname: self.surname, dob: self.dob, health: self.health, picture: self.picture, gender: self.gender, blood: self.blood){
                    self.new = false
                    self.child.recreate(childData: self.children.current())
                }
            }) {
                HStack{
                Spacer()
                SlimButtonView(name: "Create profile", background: .green)
                Spacer()
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
            .navigationBarHidden(true)
            .navigationBarTitle("")
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
    }
}

struct CreateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfileView(children: Children(), new: .constant(true))
    }
}



//name: String, surname: String, dob: Date, health: Bool = false, picture: String = "default", gender: Bool?, blood: String
 
