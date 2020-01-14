//
//  ContentView.swift
//  Crossbreed
//
//  Created by Matthew Jones on 2019-07-14.
//  Copyright © 2019 Matthew Jones. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @EnvironmentObject var persistedState: PersistedState
    
    private var stateContent: AnyView {
        switch persistedState.isOnboarded {        
        case true: return AnyView(HomeView())
        case false: return AnyView(OnboardingView())
        }
    }
    
    var body: some View {
        NavigationView {
            stateContent
            .background(NavigationConfigurator { nc in
                nc.navigationBar.barTintColor = UIColor(red:0.25, green:0.55, blue:0.18, alpha:1.0)
                nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
                nc.navigationBar.tintColor = UIColor.white
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
}

#if DEBUG
var searchState = SearchState()
var persistedState = PersistedState()
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(searchState)
            .environmentObject(persistedState)
    }
}
#endif
