//
//  SettingsView.swift
//  Crossbreed
//
//  Created by Matthew Jones on 2020-01-03.
//  Copyright © 2020 Matthew Jones. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    @State var mapChoice = 0
    @State var isShowing = true
    
    var settings = ["Otreeba", "Coming Soon"]
    
    var body: some View {
        VStack {
            Text("API")
                .font(.title)
                .padding()
                .padding(.top)
            Toggle(isOn: self.$isShowing) {
                Text("Hello World")
            }
                .padding(.horizontal, 30)
            Spacer()
//            Text("API")
//                .font(.title)
//            Picker(selection: self.$mapChoice, label: Text("Strength")) {
//                ForEach(0 ..< settings.count) { index in
//                    Text(self.settings[index])
//                        .tag(index)
//                }
//
//            }.pickerStyle(SegmentedPickerStyle())
        }
        .navigationBarTitle("Settings", displayMode: .inline)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
