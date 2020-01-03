//
//  HomeView.swift
//  Crossbreed
//
//  Created by Matthew Jones on 2020-01-02.
//  Copyright © 2020 Matthew Jones. All rights reserved.
//

import SwiftUI

struct HomeView : View {
    @EnvironmentObject var globalState: GlobalState
    @ObservedObject var homeState = HomeState()    
    
    private var stateContent: AnyView {
        switch homeState.localState {
        case .input:
            return AnyView(
                VStack {
                    SearchField(label: "Search", placeholder: "Enter text here")
                    Button(action: {
                      self.homeState.localState = .result

                    }) {
                        Text("Search Strain")
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color("gradient1"))
                    .cornerRadius(40)
                    .padding(.horizontal, 20)
                }
                
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
//                    FetchView(StrainFetcher(query: globalState.searchString))
                    FetchView()
                }
            )
        }
    }
    
    var body: some View {
        NavigationView {
            stateContent
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
