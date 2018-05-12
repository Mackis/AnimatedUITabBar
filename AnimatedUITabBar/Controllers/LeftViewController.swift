//
//  LeftViewController.swift
//  AnimatedUITabBar
//
//  Created by Malcolm Kumwenda on 2018/04/15.
//  Copyright © 2018 Malcolm Kumwenda. All rights reserved.
//

import UIKit
import SwiftIcons

class LeftViewController: MDVTabbableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
    }
    
    func mdvTabBarItem() -> UITabBarItem {
        let tabBarItem = UITabBarItem()
        tabBarItem.selectedImage = UIImage(icon: .dripicon(.home),
                                           size: CGSize(width: 25, height: 25),
                                           textColor: .blue,
                                           backgroundColor: .clear)
        tabBarItem.image = UIImage(icon: .dripicon(.heart),
                                   size: CGSize(width: 25, height: 25),
                                   textColor: .red,
                                   backgroundColor: .clear)
        return tabBarItem
    }
}
