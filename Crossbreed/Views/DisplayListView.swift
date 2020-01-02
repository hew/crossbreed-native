//
//  DisplayListView.swift
//  Crossbreed
//
//  Created by Matthew Jones on 2019-07-17.
//  Copyright © 2019 Matthew Jones. All rights reserved.
//

import SwiftUI

struct DisplayListView : View {
  @State var users = ["Paul", "Taylor", "Adele"]

    var body: some View {
      NavigationView {
        List {
            ForEach(users, id: \.self) { user in
                Text("helllo")
          }
          .onDelete(perform: delete)
        }
        .navigationBarItems(trailing: EditButton())
      }
    }

  func delete(at offsets: IndexSet) {
    if let first = offsets.first {
      users.remove(at: first)
    }
  }
}
#if DEBUG
struct DisplayListView_Previews : PreviewProvider {
  static var previews: some View {
    DisplayListView()
  }
}
#endif
