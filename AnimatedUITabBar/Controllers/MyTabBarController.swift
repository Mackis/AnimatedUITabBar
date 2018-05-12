//
//  MyTabBarController.swift
//  AnimatedUITabBar
//
//  Created by Malcolm Kumwenda on 2018/05/02.
//  Copyright © 2018 Malcolm Kumwenda. All rights reserved.
//

import UIKit

class MyTabBarController: MDVTabBarController {
    
    override init() {
        super.init()
        mdvDataSource = self
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}

extension MyTabBarController: MDVTabBarControllerDataSource {
    func tabBarControllerInitialIndex() -> Int {
        return 1
    }
    
    func tabBarControllerViewControllers() -> [MDVTabbableViewController] {
        return [LeftViewController(),
                MiddleViewController(),
                RightViewController(),
                LeftViewController()]
    }
    
    func tabBarHeight() -> CGFloat {
        return 40
    }
    
    func tabBarBackgroundColor() -> UIColor {
        return .green
    }
    
    func tabBarAnimator() -> MDVTabBarAnimatable {
        return UnderlineAnimator(withUnderlineColor: .red,
                                 underlineHeight: CGFloat(4),
                                 underlineWidth: CGFloat(16),
                                 underlineOffsetY: CGFloat(16),
                                 duration: 1,
                                 delay: 1,
                                 scale: 2)
    }
}
