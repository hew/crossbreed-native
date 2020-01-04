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

enum HomeVariants {
    case onboarding
    case main
}

class HomeState: ObservableObject {
    @Published var home: HomeVariants = .main
}

//class PersistedState: ObservableObject {
//    
//}

class GlobalState: ObservableObject {
    @Published var searchString = ""
    @Published var isOnboarded: Bool = UserDefaults.standard.bool(forKey: "isOnboarded") {
        didSet {
            UserDefaults.standard.set(self.isOnboarded, forKey: "isOnboarded")
        }
    }
}
