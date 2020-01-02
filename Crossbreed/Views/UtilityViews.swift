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


struct StrainDetails: View {
    var strain: Strain
    
    var body: some View {
        VStack {
            HStack {
                LoadableImage(with: strain.image).frame(width: 60, height: 60)
                Text(strain.name)
                
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
