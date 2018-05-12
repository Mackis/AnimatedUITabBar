//
//  RightViewController.swift
//  AnimatedUITabBar
//
//  Created by Malcolm Kumwenda on 2018/04/15.
//  Copyright © 2018 Malcolm Kumwenda. All rights reserved.
//

import UIKit

class RightViewController: MDVTabbableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
    }
    
    func mdvTabBarItem() -> UITabBarItem {
        let tabBarItem = UITabBarItem(title: "", image: nil, selectedImage: nil)
        tabBarItem.setIcon(icon: .dripicon(.home),
                           size: CGSize(width: 30, height: 30),
                           textColor: .blue)
        return tabBarItem
    }
}
