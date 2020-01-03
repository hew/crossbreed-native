//
//  Fetcher.swift
//  Crossbreed
//
//  Created by Matthew Jones on 2019-12-31.
//  Copyright © 2019 Matthew Jones. All rights reserved.
//


import Foundation
import SwiftUI
import Combine


enum LoadableState<T> {
    case loading
    case fetched(Result<T, FetchError>)
}

enum FetchError: Error {
    case error(String)
    
    var localizedDescription: String {
        switch self {
        case .error(let message):
            return message
        }
    }
}

class StrainFetcher: ObservableObject {
    @Published var state: LoadableState<RawRequest> = .loading
    private var baseUrl: String = "https://gist.githubusercontent.com/hew/7be29a306f8329e19ef92618a3a801bd/raw/4dc0dd8e1c6605e573497bb8fd50f19d83dc0577/data.json"
    
    init(query: String) {
        print(baseUrl + query)
        guard let apiUrl = URL(string: "\(baseUrl)") else {
            state = .fetched(.failure(.error("Malformed API URL.")))
            return
        }
        
        URLSession.shared.dataTask(with: apiUrl) {(data, _, error) in
            if let error = error {
                self.state = .fetched(.failure(.error(error.localizedDescription)))
                return
            }
            
            guard let data = data else {
                self.state = .fetched(.failure(.error("Malformed response data")))
                return
            }
            
            do {
                let r = try JSONDecoder().decode(RawRequest.self, from: data)
                
                DispatchQueue.main.async {
                    self.state = .fetched(.success(r))
                }
                
            } catch {
                print("ERROR: failed to decode API data")
            }
            
        }.resume()
    }
}


class ImageFetcher: ObservableObject {
    
    @Published var data = Data()
    
    init(url: String) {
        guard let imageUrl = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageUrl) { (data, _, _) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }.resume()
    }
}


struct FetchView: View {
    
    @ObservedObject var fetcher: StrainFetcher
    
    init(_ fetcher: StrainFetcher) {
        self.fetcher = fetcher
    }
    
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
        stateContent.navigationBarTitle("Something")
    }
    
}

#if DEBUG
//struct FetchView_Previews : PreviewProvider {
//    static var previews: some View {
//        FetchView()
//    }
//}
#endif
