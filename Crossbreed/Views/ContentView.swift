//
//  ContentView.swift
//  Crossbreed
//
//  Created by Matthew Jones on 2019-07-14.
//  Copyright © 2019 Matthew Jones. All rights reserved.
//

import SwiftUI

enum LocalState {
    case onboarding
    case main
}

struct ContentView : View {
    
//    @ObservedObject var persistedState = PersistedState()
    @EnvironmentObject var persistedState: GlobalState
    
    private var stateContent: AnyView {
        switch persistedState.isOnboarded {
        case true: return AnyView(HomeView())
        case false: return AnyView(OnboardingView())
        }
    }
    
    var body: some View {
        NavigationView {
            stateContent            
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
