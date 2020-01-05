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
    var iconString: String = "magnifyingglass.circle.fill"
    var pageNumber: String
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Crossbreed")
            .font(AppFont.logo)
            .foregroundColor(Color.white)
            .bold()
            .padding(.vertical)
            Image(systemName: iconString)
                .padding(.bottom)
                .font(.system(size: 50))
                .foregroundColor(Color.white)
            Text(self.featureTitle)
                .font(AppFont.title)
                .foregroundColor(Color.white)
                .bold()
                .padding(.vertical)
            Text(self.featureDescription)
                .font(AppFont.body)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .padding(.bottom, 42)
//            Text("\(pageNumber)/3")
//                           .padding()
//                           .foregroundColor(.white)
            
        }
        .padding(.leading, 36)
        .padding(.trailing, 36)
    }
}

struct OnboardingView: View {
    
    @EnvironmentObject var persistedState: PersistedState
    
    let pages = [
        AnyView(OnboardingPage(
            featureTitle: "Search Strains",
            featureDescription: "Search from a database of over 10,000 different strains.",
            iconString: "magnifyingglass.circle.fill",
            pageNumber: "1"
            )
        ),
        AnyView(OnboardingPage(
            featureTitle: "Learn Genetics",
            featureDescription: "Learn about strain lineages, seed companies, and more.",
            iconString: "lightbulb.fill",
            pageNumber: "2"
            )
        ),
//        AnyView(OnboardingPage(
//            featureTitle: "That's It",
//            featureDescription: "Click the circle one more time to get started.",
//            iconString: "checkmark.circle.fill",
//            pageNumber: "3"
//            )
//        ),
        AnyView(EmptyView()),
    ]
    
    let colors = [
        // primary dark
        "711330",
        // primary
        "983351",
        // primary light
//        "BE5F7B",
        // Final (white)
        "FFFFFF",        
        ].map{ Color(hex: $0) }
    
    var body: some View {
        ConcentricOnboarding(pages: pages, bgColors: colors, onComplete: {
           self.persistedState.isOnboarded = true
        })
    }
}

#if DEBUG
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
#endif
