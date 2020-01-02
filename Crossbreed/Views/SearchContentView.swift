//
//  SearchContentView.swift
//  Crossbreed
//
//  Created by Matthew Jones on 2019-07-14.
//  Copyright © 2019 Matthew Jones. All rights reserved.
//

import SwiftUI

struct SearchContentView : View {   
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        VStack {
            LabelTextField(label: "Search a Strain", placeholder: "(Enter text here)")

        }
    }
}

#if DEBUG
struct SearchContentView_Previews : PreviewProvider {
    static var previews: some View {
        SearchContentView().environmentObject(UserSettings())
    }
}
#endif
