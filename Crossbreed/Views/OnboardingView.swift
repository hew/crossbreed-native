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
    
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: iconString)
                .padding(.bottom)
                           .font(.largeTitle)
                           .foregroundColor(Color.red)
            Text(self.featureTitle)
                .font(Font.custom("AppleGothic Regular", size: 20))
                .foregroundColor(Color.white)
                .bold()
                .padding(.vertical)
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

//struct OnboardingPageLast : View {
//
//    @EnvironmentObject var persistedState: GlobalState
//
//    var featureTitle: String
//    var featureDescription: String
//    var iconString: String = "magnifyingglass.circle.fill"
//
//    var body: some View {
//        VStack(alignment: .center) {
//            GradientButton(onPress: {
//                self.persistedState.isOnboarded = false
//            }, buttonText: "Start Searching")
//        }
//        .padding(.leading, 36)
//        .padding(.trailing, 36)
//    }
//}

struct OnboardingView: View {
    
    @EnvironmentObject var persistedState: GlobalState
    
    let pages = [
        AnyView(OnboardingPage(featureTitle: "Search Flowers", featureDescription: "Search from a database of over 10,000 different flower strains.", iconString: "magnifyingglass.circle.fill")),
        AnyView(OnboardingPage(featureTitle: "Learn Lineage & More", featureDescription: "Learn about strain lineages and more!", iconString: "lightbulb.fill")),
        AnyView(OnboardingPage(featureTitle: "That's It", featureDescription: "Click the circle one more time to get started.", iconString: "")),
        AnyView(EmptyView()),
    ]
    
    let colors = [
        "F38181",
        "95E1D3",
        "F38181",
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
        OnboardingView().environmentObject(globalState)
    }
}
#endif
