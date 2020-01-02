//
//  ContentView.swift
//  Crossbreed
//
//  Created by Matthew Jones on 2019-07-14.
//  Copyright © 2019 Matthew Jones. All rights reserved.
//

import SwiftUI

enum SearchState {
    case input
    case result
}

class HomeController: ObservableObject {
    @Published var localState: SearchState = .input
}

struct ContentView : View {
    
    @ObservedObject var controller = HomeController()
    
    private var stateContent: AnyView {
        switch controller.localState {
        case .input:
            return AnyView(
                VStack {
                    SearchField(label: "Search", placeholder: "Enter text here")
                    Button(action: {
                        self.controller.localState = .result
                        
            }) {
                Text("Show details")
            }
        }
        )
        case .result:
            return AnyView( FetchView() )
    }
}

var body: some View {
    NavigationView {
        stateContent.navigationBarTitle("Crossbreed")
    }
}
}

#if DEBUG
//let viewModel = GlobalState()

struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
