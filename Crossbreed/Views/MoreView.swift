//
//  SettingsView.swift
//  Crossbreed
//
//  Created by Matthew Jones on 2020-01-03.
//  Copyright © 2020 Matthew Jones. All rights reserved.
//

import SwiftUI

struct MoreView: View {
    
    @State var mapChoice = 0
    @State var isShowing = false
    
    var body: some View {
        VStack {
            Text("Legal")
                .font(AppFont.title)
                .padding()
                .padding(.top)
            Button(action: {
                self.isShowing = true
            }) {
                Text("View Terms of Use")
            }
            .padding()
            .foregroundColor(Color("primary"))
            Spacer()
                .navigationBarTitle("More", displayMode: .inline)
        }
        .sheet(isPresented: self.$isShowing) {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        self.isShowing = false
                    }) {
                        Image(systemName: "xmark")
                            .font(.system(.subheadline))
                            .foregroundColor(Color("primary"))
                    }
                }
                .padding()
                .padding(.top)
                PrivacyView()
            }
        }
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}

// Switch Component

//            Text("Options")
//                .font(AppFont.title)
//                .padding()
//                .padding(.top)
//            Toggle(isOn: self.$isShowing) {
//                Text("Turbo Search")
//            }
//                .padding(.horizontal, 30)

// Picker Component

//            Text("API")
//                .font(.title)
//            Picker(selection: self.$mapChoice, label: Text("Strength")) {
//                ForEach(0 ..< settings.count) { index in
//                    Text(self.settings[index])
//                        .tag(index)
//                }
//
//            }.pickerStyle(SegmentedPickerStyle())
//        }
