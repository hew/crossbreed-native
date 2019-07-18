//
//  ContentView.swift
//  Crossbreed
//
//  Created by Matthew Jones on 2019-07-14.
//  Copyright © 2019 Matthew Jones. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State private var selection = 0
 
    var body: some View {
        TabbedView(selection: $selection){
        
            SearchContentView()
                .font(.title)
                .tabItemLabel(Image("first"))
                .tag(0)
            
            Text("Second View")
                .font(.title)
                .tabItemLabel(Image("second"))
                .tag(1)
           
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
