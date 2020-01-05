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
    @EnvironmentObject var searchState: SearchState
    
    var body: some View {
        VStack {
                Spacer()
                Text("Crossbreed")
                    .font(AppFont.logo)
                    .foregroundColor(Color.white)
                Text("Search your favorite strains.")
                    .font(AppFont.body)
                    .foregroundColor(Color.white)
                    .padding()
                Spacer()
                SearchField(placeholder: "Search Strain")
            NavigationLink(destination: FetchView() ) {
                    GradientText(text: "Search Now")
                }
                Spacer()
            }
            .background(Color("secondary"))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: Alignment.topLeading)
            .edgesIgnoringSafeArea(.vertical)
//            .navigationBarTitle(Text("Search"))
            .navigationBarItems(trailing:
                NavigationLink(destination: MoreView()) {
                    Image(systemName: "ellipsis")
                        .foregroundColor(Color(.white))
                        .font(.headline)
                        .shadow(color: .gray, radius: 10.0, x: 10, y: 10)
                }
            )
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
