//
//  AppDelegate.swift
//  Wandio
//
//  Created by Guga Valashvili on 9/27/20.
//  Copyright © 2020 Guga Valashvili. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        let home = HomeViewController()
        window?.rootViewController = UINavigationController(rootViewController: home)
        window?.makeKeyAndVisible()
        
        return true
    }
}

