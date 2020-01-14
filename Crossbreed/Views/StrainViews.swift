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
            DetailsImage(with: strain.image)                
            Text(strain.name)
                .bold()
                .font(AppFont.title)
                .padding(.vertical)
            Text("\(strain.seedCompany.name ?? "Unknown Seed Company")")
                .font(AppFont.body)
                .padding(.bottom)
            Text("\(strain.ucpc)")
               .font(.footnote)
               .foregroundColor(Color("icons"))
               .padding(.bottom)
            Text("Strain Genetics:")
                .font(AppFont.title)
            List {
            ForEach(names, id: \.self) {gen in
                Text(gen)
                    .font(AppFont.genetics)
                    .foregroundColor(Color("secondary"))
                    .padding(.vertical)
            }
            }
            Spacer()
        }
    }
    
}
struct StrainRow: View {
    var strain: Strain
    
    var body: some View {
        HStack {
            ResultsImage(with: strain.image)                
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
