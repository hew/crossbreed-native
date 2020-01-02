//
//  Card.swift
//  Crossbreed
//
//  Created by Matthew Jones on 2019-12-31.
//  Copyright © 2019 Matthew Jones. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var title = "UI Design"
    var image = "Certificate1"
    var background = Color.black
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("certificate")
                        .foregroundColor(Color(.displayP3, red: 0.615686274509804, green: 0.8588235294117647, blue: 0.9058823529411765))
                    }
                    .padding(20)
                
                Spacer()
                
                Image("Logo")
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 30, height: 30)
                    .padding(.trailing, 20.0)
            }
            
            HStack {
                
                Spacer()
            }
            
            Image(image)
                .renderingMode(.original)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight:
                    0, maxHeight: 200)
                .offset(y: 50)
            }
            .background(background)
            .cornerRadius(10)
    }
}

#if DEBUG
struct CardView_Previews : PreviewProvider {
    static var previews: some View {
        CardView().previewLayout(.sizeThatFits)
    }
}
#endif
