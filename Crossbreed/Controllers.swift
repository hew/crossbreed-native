//
//  UserSettings.swift
//  Crossbreed
//
//  Created by Matthew Jones on 2019-07-17.
//  Copyright © 2019 Matthew Jones. All rights reserved.
//

import Foundation
import Combine
import SwiftUI


class HomeState: ObservableObject {
    @Published var home: HomeVariants = .main
}

class SearchState: ObservableObject {
    @Published var searchString = ""
    @Published var networkState: LoadableState<RawRequest> = .loading
    
    func fetchData() {
        
//        let baseUrl: String = "https://gist.githubusercontent.com/hew/7be29a306f8329e19ef92618a3a801bd/raw/4dc0dd8e1c6605e573497bb8fd50f19d83dc0577/data.json"
        
        let baseUrl: String = "http://cannabisreports.com/api/v1.0/strains/search/"
        
        guard let apiUrl = URL(string: "\(baseUrl)\(searchString)") else {
            networkState = .fetched(.failure(.error("Malformed API URL.")))
            return
        }
        
        URLSession.shared.dataTask(with: apiUrl) {(data, _, error) in
            if let error = error {
                self.networkState = .fetched(.failure(.error(error.localizedDescription)))
                return
            }
            
            guard let data = data else {
                self.networkState = .fetched(.failure(.error("Malformed response data")))
                return
            }
            
            do {
                let r = try JSONDecoder().decode(RawRequest.self, from: data)
                
                print(r)
                
                DispatchQueue.main.async {
                    self.networkState = .fetched(.success(r))
                }
                
            } catch {
                print("ERROR: failed to decode API data")
            }
            
        }.resume()
    }
}

class PersistedState: ObservableObject {
    @Published var isOnboarded: Bool = UserDefaults.standard.bool(forKey: "isOnboarded") {
        didSet {
            UserDefaults.standard.set(self.isOnboarded, forKey: "isOnboarded")
        }
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

