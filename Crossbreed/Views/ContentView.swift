//
//  ContentView.swift
//  Crossbreed
//
//  Created by Matthew Jones on 2019-07-14.
//  Copyright © 2019 Matthew Jones. All rights reserved.
//

import SwiftUI


struct ContentView : View {
        
    @EnvironmentObject var globalState: GlobalState
    
    var body: some View {
        VStack {
            Button(action: {
                self.globalState.isOnboarded.toggle()
            }) {
                Text("New Search")
            }
            self.globalState.isOnboarded ? AnyView(HomeView()) : AnyView(OnboardingView())
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
