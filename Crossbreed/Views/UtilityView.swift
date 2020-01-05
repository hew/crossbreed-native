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
                .font(AppFont.body)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .foregroundColor(.white)
        .background(LinearGradient(gradient: Gradient(colors: [Color("secondaryLight"), Color("secondaryLight")]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(40)
        .padding([.top, .leading, .trailing], 20)
        .shadow(color: Color("secondaryDark"), radius: 10.0, x: 10, y: 10)
    }
}

struct GradientText: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color("secondaryLight"), Color("secondaryLight")]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)
            .padding([.top, .leading, .trailing], 20)
            .shadow(color: Color("secondaryDark"), radius: 10.0, x: 10, y: 10)
    }
}


struct SearchField : View {
    @EnvironmentObject var searchState: SearchState
//    @State var query = ""
    
    var placeholder: String
    
    var body: some View {
        VStack {
            TextField(placeholder, text: self.$searchState.searchString, onEditingChanged: {(changed) in
                print("typing...")
//                self.searchState.searchString = self.query
            })                
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.horizontal, 20)
            .zIndex(1)
        }        
    }
}

struct ModalView: View {
    @Binding var showModal: Bool
    
    var body: some View {
        VStack {
            Text("Inside Modal View")
                .padding()
            // 2.
            Button("Dismiss") {
                self.showModal.toggle()
            }
        }
    }
}

struct Utility_Previews: PreviewProvider {
    static var previews: some View {
        SearchField(placeholder: "beep")
    }
}
