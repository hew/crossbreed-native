//
//  FetchView.swift
//  Crossbreed
//
//  Created by Matthew Jones on 2020-01-03.
//  Copyright © 2020 Matthew Jones. All rights reserved.
//

import SwiftUI

struct FetchView: View {
    
    @ObservedObject var fetcher = StrainFetcher()
    
//    init(_ fetcher: StrainFetcher) {
//        self.fetcher = fetcher
//    }
    
    private var stateContent: AnyView {
        switch fetcher.state {
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
                            NavigationLink(destination: StrainRow(strain: strain)) {
                                StrainDetails(strain: strain)
                            }
                        }
                    }
                )
            }
        }
    }
    
    var body: some View {
        stateContent.navigationBarTitle("Results")
    }
    
}

struct FetchView_Previews: PreviewProvider {
    static var previews: some View {
        FetchView()
    }
}
