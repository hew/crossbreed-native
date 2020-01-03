//
//  ContentView.swift
//  Crossbreed
//
//  Created by Matthew Jones on 2019-07-14.
//  Copyright © 2019 Matthew Jones. All rights reserved.
//

import SwiftUI


struct ContentView : View {
        
    @ObservedObject var persistedState = PersistedState()
    
    var body: some View {
        VStack {            
            self.persistedState.isOnboarded ? AnyView(HomeView()) : AnyView(OnboardingView())
        }        
    }
}

#if DEBUG
var globalState = GlobalState()
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(globalState)
    }
}
#endif
