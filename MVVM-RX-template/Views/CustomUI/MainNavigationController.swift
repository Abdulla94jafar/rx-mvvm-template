//
//  MainNavVC.swift
//  MVVM-RX-template
//
//  Created by Abdulla Jafar on 8/11/20
//

import UIKit

class MainNavigationController: UINavigationController {
    
    
    // MARK: - LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        customize()
    }
    
    
    // MARK: - PRIVATE
    internal func customize() {
        self.view.backgroundColor = .systemBackground
        self.navigationBar.prefersLargeTitles = true
    }


}
