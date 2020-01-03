//
//  OnboardingView.swift
//  Crossbreed
//
//  Created by Matthew Jones on 2020-01-02.
//  Copyright © 2020 Matthew Jones. All rights reserved.
//

import SwiftUI

struct OnboardingPage : View {
    
    var featureTitle: String
    var featureDescription: String
    
    init(
        featureTitle: String,
        featureDescription: String
    ) {
        self.featureTitle = featureTitle
        self.featureDescription = featureDescription
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Text(self.featureTitle)
                .font(Font.custom("AppleGothic Regular", size: 20))
                .foregroundColor(Color.white)
                .bold()
                .padding(.bottom)
            Text(self.featureDescription)
                .font(Font.custom("Poppins-Regular", size: 16))
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .padding(.bottom, 42)
        }
        .padding(.leading, 36)
        .padding(.trailing, 36)
    }
}

struct OnboardingView: View {
    let beep = [
        AnyView(OnboardingPage(featureTitle: "Search Strains", featureDescription: "")),
        AnyView(OnboardingPage(featureTitle: "Learn lineage", featureDescription: "")),
        AnyView(OnboardingPage(featureTitle: "Consume smarter", featureDescription: ""))
    ]
    
    let colors = [
        "F38181",
        "FCE38A",
        "95E1D3",
        "EAFFD0"
        ].map{ Color(hex: $0) }
    
    var body: some View {
        ConcentricOnboarding(pages: beep, bgColors: colors)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
