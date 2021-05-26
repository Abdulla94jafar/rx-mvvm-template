//
//  AppDelegate.swift
//  MVVM-RX-template
//
//  Created by Abdulla Jafar on 7/3/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let mainNav =  MainNavigationController(rootViewController: HomeVC())
        window.rootViewController = mainNav
        window.makeKeyAndVisible()
        self.window = window
        return true
    }


}

