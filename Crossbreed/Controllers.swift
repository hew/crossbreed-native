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

class GlobalState: ObservableObject {
    @Published var searchString = ""
}
