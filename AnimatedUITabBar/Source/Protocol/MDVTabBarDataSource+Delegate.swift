//
//  MDVTabBarDataSource+Delegate.swift
//  AnimatedUITabBar
//
//  Created by Malcolm Kumwenda on 2018/05/12.
//  Copyright © 2018 Malcolm Kumwenda. All rights reserved.
//

import UIKit

protocol MDVTabBarDelegate {
    func didSelect(tabAtIndex index: Int)
}

protocol MDVTabBarDataSource {
    func mdvTabBarItems() -> [UITabBarItem]
    func mdvTabBarAnimator() -> MDVTabBarAnimatable
}
