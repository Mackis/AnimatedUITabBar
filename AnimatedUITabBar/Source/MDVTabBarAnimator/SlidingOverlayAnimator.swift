//
//  SlidingOverlayAnimator.swift
//  AnimatedUITabBar
//
//  Created by Malcolm Kumwenda on 2018/04/16.
//  Copyright © 2018 Malcolm Kumwenda. All rights reserved.
//

import UIKit

class SlidingOverlayAnimator: MDVTabBarAnimatable {
    
    private var tabColors: [UIColor]!
    
    init(withTabBarColors tabColors: [UIColor]){
        self.tabColors = tabColors
        
    }
    
    func prepareForAnimation(onAnimatedTabBar tabBar: UIView, withContainers containers: [MDVTabBarContainer], andInitialIndex initialIndex: Int) {
        
    }
    
    func performAnimation(fromIndex: Int,
                          toIndex: Int,
                          onAnimatedTabBar tabBar: UIView,
                          withContainers containers: [MDVTabBarContainer],
                          completion: @escaping () -> Void) {
        
    }
}
