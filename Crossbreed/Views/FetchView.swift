//
//  FetchView.swift
//  Crossbreed
//
//  Created by Matthew Jones on 2020-01-03.
//  Copyright © 2020 Matthew Jones. All rights reserved.
//

import SwiftUI

struct FetchView: View {
    
    @EnvironmentObject var searchState: SearchState
    
    private var stateContent: AnyView {
        switch searchState.networkState {
        case .loading:
            return AnyView(
                ActivityIndicator(style: .medium)
            )
        case .fetched(let result):
            switch result {
            case .failure(let error):
                return AnyView(
                    Text(error.localizedDescription)
                )
            case .success(let resp):
                let strains = resp.data;
                return AnyView(
                    VStack {
                        List(strains){strain in
                            NavigationLink(destination: StrainDetails(strain: strain)) {
                                StrainRow(strain: strain)
                            }
                        }
                        .padding(.top)
                    }
                )
            }
        }
    }
    
    var body: some View {
        stateContent
            .navigationBarTitle("Results", displayMode: .inline)        
            .onAppear {
                self.searchState.fetchData()
        }
    }
    
}

//struct FetchView_Previews: PreviewProvider {
//    static var previews: some View {
//        FetchView()
//    }
//}
