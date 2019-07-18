//
//  LabelTextView.swift
//  Crossbreed
//
//  Created by Matthew Jones on 2019-07-14.
//  Copyright © 2019 Matthew Jones. All rights reserved.
//

import SwiftUI

struct LabelTextField : View {
    @State var query: String = "Search..."
    var label: String
    var placeholder: String
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(label)
                .font(.headline)
            TextField(placeholder, text: $query)
        }
        .padding(.horizontal, 15)
    }
}

#if DEBUG
struct LabelTextView_Previews : PreviewProvider {
    static var previews: some View {
        LabelTextField(label: "Search", placeholder: "Enter text here")
    }
}
#endif
