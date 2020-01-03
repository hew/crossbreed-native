//
//  HomeView.swift
//  Crossbreed
//
//  Created by Matthew Jones on 2020-01-02.
//  Copyright © 2020 Matthew Jones. All rights reserved.
//

import SwiftUI
import Combine

struct HomeView : View {
    @EnvironmentObject var globalState: GlobalState
    
    var body: some View {
        NavigationView {
            VStack {
                SearchField(placeholder: "Search Strain")
                NavigationLink(destination: FetchView() ) {
                    GradientText(text: "Search Now")
                }                
            }
        }        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//    @ObservedObject var homeState = HomeState()
    
//    private var stateContent: AnyView {
//        switch homeState.localState {
//        case .input:
//            return AnyView(
//
//            )
//        case .result:
//            return AnyView(
//                VStack {
//                    FetchView()
//                    GradientButton(onPress: {
//                        self.homeState.localState = .input
//                    }, buttonText: "New Search")
//                        .padding(.vertical)
//                }
//            )
//        }
//    }
