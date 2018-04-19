//
//  SlidingOverlayAnimator.swift
//  AnimatedUITabBar
//
//  Created by Malcolm Kumwenda on 2018/04/16.
//  Copyright © 2018 Malcolm Kumwenda. All rights reserved.
//

import UIKit

class SlidingOverlayAnimator: UITabBarAnimatable {
    
    private var tabColors: [UIColor]!
    
    init(withTabBarColors tabColors: [UIColor]){
        self.tabColors = tabColors
    }
    
    func prepareForAnimation(onView view: UIView, withContainers containers: [UIView], andInitialIndex: Int) {
        for index in 0..<containers.count {
            containers[index].backgroundColor = tabColors[index]
        }
        let v = UIView(frame: CGRect(x: 0,
                                     y: 0,
                                     width: 250,
                                     height: 20))
        v.backgroundColor = .black
        v.clipsToBounds = false
        containers.first?.insertSubview(v, at: 0)
    }
    
    func performAnimation(fromIndex: Int, toIndex: Int, onView: UIView, withContainers containers: [UIView]) {
        
    }
}
