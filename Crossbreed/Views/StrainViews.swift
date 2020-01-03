//
//  StrainViews.swift
//  Crossbreed
//
//  Created by Matthew Jones on 2020-01-03.
//  Copyright © 2020 Matthew Jones. All rights reserved.
//

import SwiftUI

struct StrainDetails: View {
    var strain: Strain
        
    var body: some View {
        
        let names = strain.genetics.names;
        
        return VStack {
            LoadableImage(with: strain.image).frame(width: 60, height: 60)
            Text(strain.name)
                .padding(.bottom)
            Text("id: \(strain.ucpc)")
                .font(.footnote)
                .foregroundColor(Color("icons"))
            Spacer()
            Text("Lineage")
                .padding(.top)
            List(names, id: \.self) {gen in
                Text(gen)
            }
        }
    }
    
}
struct StrainRow: View {
    var strain: Strain
    
    var body: some View {
        HStack {
            LoadableImage(with: strain.image).frame(width: 60, height: 60)
            Text(strain.name)
                .padding([.horizontal])
            
        }
    }
}

struct StrainViews: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct StrainViews_Previews: PreviewProvider {
    static var previews: some View {
        StrainViews()
    }
}
