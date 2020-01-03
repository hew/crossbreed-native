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

enum SearchState {
    case input
    case result
}

class HomeState: ObservableObject {
    @Published var localState: SearchState = .input
}

class GlobalState: ObservableObject {
    @Published var searchString = ""
}

class PersistedState: ObservableObject {
    @Published var isOnboarded: Bool = UserDefaults.standard.bool(forKey: "isOnboarded") {
        didSet {
            UserDefaults.standard.set(self.isOnboarded, forKey: "isOnboarded")
        }
    }
}

