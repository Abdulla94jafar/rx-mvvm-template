//
//  StringExtension.swift
//  MVVM-RX-template
//
//  Created by Abdulla Jafar on 8/16/20
//

import Foundation





public extension String {
    
    
    func localize() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    // COMMONLY USED STRINGS
    static let failureText = "Failure".localize()
    static let cancelText = "Cancel".localize()
    static let dismissText = "Dismiss".localize()
    static let retryText = "Retry".localize()
}
