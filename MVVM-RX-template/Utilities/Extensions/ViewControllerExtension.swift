//
//  ControllerExtension.swift
//  MVVM-RX-template
//
//  Created by Abdulla Jafar on 8/20/20
//

import UIKit

#if DEBUG
import SwiftUI

@available(iOS 13, *)
extension UIViewController {
    
    private struct vcPreview: UIViewControllerRepresentable {
        let viewController: UIViewController
        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }

    func toPreview() -> some View {
        vcPreview(viewController: self)
    }
}
#endif



public extension UIViewController {
    internal func showFailureAlertWith(_ error : AppError, andActionTitle aTitle : String  , action : @escaping () -> Void  ) {
        let alert = UIAlertController(title: .failureText, message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: .cancelText, style: .cancel, handler: nil))
        let action = UIAlertAction(title: aTitle, style: .default) { _ in action() }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    internal func showFailureAlertWith(_ error : AppError ) {
        print(error.localizedDescription)
        let alert = UIAlertController(title: .failureText, message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: .cancelText, style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
