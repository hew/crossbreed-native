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

class UserSettings: ObservableObject {
    var willChange = PassthroughSubject<Void, Never>()
    
    var score = 0 {
        willSet {
            willChange.send(())
        }
    }
}
