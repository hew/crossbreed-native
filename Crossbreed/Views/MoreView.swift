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
//            Text("About")
//            .font(AppFont.title)
//            .padding()
//            .padding(.top)
//            Text("Crossbreed was designed and built in Vancouver, BC.")
//                .font(AppFont.body)
//                .padding()
//                .padding(.top)
            Text("Legal")
                .font(AppFont.title)
                .padding()
                .padding(.top)
            Button(action: {
                self.isShowing = true
            }) {
                Text("View Privacy Policy")
            }
            .padding()
            .foregroundColor(Color("secondary"))
            .font(AppFont.body)
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
                            .font(.system(.headline))
                            .foregroundColor(Color("secondary"))
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
