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
                .padding(.top)
            Text(strain.name)
                .padding(.bottom)
            Text("id: \(strain.ucpc)")
                .font(.footnote)
                .foregroundColor(Color("icons"))            
            Text("Lineage")
                .padding(.top)
            ForEach(names, id: \.self) {gen in
                Text(gen)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("secondaryLight"), Color("secondaryLight")]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(40)
                    .padding([.top, .leading, .trailing], 20)
                    .shadow(color: .gray, radius: 10.0, x: 10, y: 10)
            }
            Spacer()
        }
    }
    
}
struct StrainRow: View {
    var strain: Strain
    
    var body: some View {
        HStack {
            LoadableImage(with: strain.image).frame(width: 60, height: 60)
                .border(Color("secondary"))
            Text(strain.name)
                .fontWeight(.medium)
                .padding([.horizontal])
            //            .foregroundColor(Color("secondary"))
            
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
