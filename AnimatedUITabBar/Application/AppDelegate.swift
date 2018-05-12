//
//  AppDelegate.swift
//  AnimatedUITabBar
//
//  Created by Malcolm Kumwenda on 2018/04/15.
//  Copyright © 2018 Malcolm Kumwenda. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Initialise our application.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        // 1. Create TabBar with initial index
        // 2. Give it it's tabBarItems
        // 3. Give it it's viewControllers
        // 4. Give it it's animator
        // 5. Set it's delegate 
        let tabBarController = MyTabBarController()
        tabBarController.selectedIndex = 3
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

