//
//  MotherView.swift
//  BabyChild
//
//  Created by Mow on 04/12/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI

struct MotherView: View {
    var body: some View {
        VStack{
            WizardView(titleText: "Mother tips", context: wizardMother)
            Text("Mother's sleep")
                .font(.title)
                .fontWeight(.thin)
            SleepView()
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView()
    }
}
