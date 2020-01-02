//
//  LabelTextView.swift
//  Crossbreed
//
//  Created by Matthew Jones on 2019-07-14.
//  Copyright © 2019 Matthew Jones. All rights reserved.
//

import SwiftUI

struct SearchField : View {
    @EnvironmentObject var globalState: GlobalState
    @State var query = ""
    
    var label: String
    var placeholder: String
    
    var body: some View {
        
        VStack {
            Text(label)
            TextField(placeholder, text: $query, onEditingChanged: {(changed) in
                self.globalState.searchString = self.query
            }
        )}
        .padding(.horizontal, 15)
    }
}

#if DEBUG
struct SearchField_Previews : PreviewProvider {
    static var previews: some View {
        SearchField(label: "Search", placeholder: "Enter text here")
    }
}
#endif
