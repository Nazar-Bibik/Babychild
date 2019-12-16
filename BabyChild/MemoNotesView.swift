//
//  MemoNotesView.swift
//  BabyChild
//
//  Created by Nazar on 16/12/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import SwiftUI

// List of note memos
struct MemoNotesView: View {
    @State var notes: [Note]
    @EnvironmentObject var child: Child
    
    var body: some View {
        List{
            ForEach(notes, id: \.self) {note in
                VStack(alignment: .leading){
                        Text(self.child.showName() + "'s " + note.name!)
                    .font(.headline)
                        Text(DateHelper.showDate(datetime: note.time!))
                    .fontWeight(.light)
                }
            }
        }
    }
}

//struct MemoNotesView_Previews: PreviewProvider {
//    static var previews: some View {
//        MemoNotesView()
//    }
//}
