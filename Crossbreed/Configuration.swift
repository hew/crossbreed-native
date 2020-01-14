//
//  Configuration.swift
//  Crossbreed
//
//  Created by Matthew Jones on 2020-01-04.
//  Copyright © 2020 Matthew Jones. All rights reserved.
//

import SwiftUI
import Combine

enum HomeVariants {
    case onboarding
    case main
}

enum LoadableState<T> {
    case loading
    case fetched(Result<T, FetchError>)
}

enum FetchError: Error {
    case error(String)
    
    var localizedDescription: String {
        switch self {
        case .error(let message):
            return message
        }
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }
}

extension Color {
    var uiColor: UIColor {
        let values = description.split(separator: " ")
        if values.count == 5 {
            return UIColor(red: CGFloat(Double(values[1]) ?? 1), green: CGFloat(Double(values[2]) ?? 1), blue: CGFloat(Double(values[3]) ?? 1), alpha: CGFloat(Double(values[4]) ?? 1))
        }
        return UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    }
}

struct AppFont {
  static let logo = Font.custom("GillSans-SemiBold", size: 42.0)
  static let title = Font.custom("GillSans-SemiBold", size: 24.0)
  static let body = Font.custom("GillSans", size: 14.0)
  static let genetics = Font.custom("GillSans", size: 18.0)
}

final class KeyboardResponder: ObservableObject {
    private var notificationCenter: NotificationCenter
    @Published private(set) var currentHeight: CGFloat = 0

    init(center: NotificationCenter = .default) {
        notificationCenter = center
        notificationCenter.addObserver(self, selector: #selector(keyBoardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyBoardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    deinit {
        notificationCenter.removeObserver(self)
    }

    @objc func keyBoardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            currentHeight = keyboardSize.height
        }
    }

    @objc func keyBoardWillHide(notification: Notification) {
        currentHeight = 0
    }
}
