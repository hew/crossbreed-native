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
    @ObservedObject var homeState = HomeState()
    @ObservedObject var persistedState = PersistedState()
    
    private var stateContent: AnyView {
        switch homeState.localState {
        case .input:
            return AnyView(
//                VStack {
//                    SearchField(label: "Search", placeholder: "Enter text here")
//                    Button(action: {
//                      print(self.persistedState.isOnboarded)
//                      self.homeState.localState = .result
//
//                    }) {
//                        Text("Search Strain")
//                    }
//                    .frame(minWidth: 0, maxWidth: .infinity)
//                    .padding()
//                    .foregroundColor(.white)
//                    .background(Color("gradient1"))
//                    .cornerRadius(40)
//                    .padding(.horizontal, 20)
//                }
                OnboardingView()
            )
        case .result:
            return AnyView(
                VStack {
                    Button(action: {
                        self.homeState.localState = .input

                    }) {
                        Text("New Search")
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color("gradient1"))
                    .cornerRadius(40)
                    .padding(.horizontal, 20)
                    FetchView(StrainFetcher(query: globalState.searchString))
                }
            )
        }
    }
    
    var body: some View {
        stateContent
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
