//
//  Views.swift
//  Crossbreed
//
//  Created by Matthew Jones on 2020-01-01.
//  Copyright © 2020 Matthew Jones. All rights reserved.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        uiView.startAnimating()
    }
}

struct LoadableImage: View {
    @ObservedObject var imageFetcher: ImageFetcher
    
    init(with urlString: String) {
        imageFetcher = ImageFetcher(url: urlString)
    }
    
    var body: some View {
        if let image = UIImage(data: imageFetcher.data) {
            return AnyView(
                Image(uiImage: image).resizable()
            )
        } else {
            return AnyView(
                ActivityIndicator(style: .medium)
            )
        }
    }
}

struct GradientButton: View {
    
    var onPress: () -> Void
    var buttonText: String
    
    var body: some View {
        Button(action: {
            self.onPress()
        }) {
            Text(buttonText)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .foregroundColor(.white)
        .background(LinearGradient(gradient: Gradient(colors: [Color("gradient2"), Color("gradient1")]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(40)
        .padding([.top, .leading, .trailing], 20)
        .shadow(color: .gray, radius: 10.0, x: 10, y: 10)
    }
}

struct GradientText: View {
    
    var text: String
    
    var body: some View {
        Text(text)
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .foregroundColor(.white)
        .background(LinearGradient(gradient: Gradient(colors: [Color("gradient2"), Color("gradient1")]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(40)
        .padding([.top, .leading, .trailing], 20)
        .shadow(color: .gray, radius: 10.0, x: 10, y: 10)
    }
}


struct SearchField : View {
    @EnvironmentObject var globalState: GlobalState
    @State var query = ""
    
//    var label: String
    var placeholder: String
    
    var body: some View {
        
        VStack {
//            Text(label)
            TextField(placeholder, text: $query, onEditingChanged: {(changed) in
                self.globalState.searchString = self.query
            }
        )}
        .padding(.horizontal, 15)
        .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}
