//
//  ZoomAnimator.swift
//  AnimatedUITabBar
//
//  Created by Malcolm Kumwenda on 2018/04/16.
//  Copyright © 2018 Malcolm Kumwenda. All rights reserved.
//

import UIKit

class ZoomAnimator: MDVTabBarAnimatable {
    
    private var scale: CGFloat
    private var duration: Double
    private var delay: Double
    
    init(withScale scale: CGFloat = 1.5,
         duration: Double = 0.3,
         delay: Double = 0) {
        self.scale = scale
        self.duration = duration
        self.delay = delay
    }
    
    func prepareForAnimation(onAnimatedTabBar tabBar: UIView, withContainers containers: [MDVTabBarContainer], andInitialIndex initialIndex: Int) {
        var itemsToDismiss = containers
        itemsToDismiss.remove(at: initialIndex)
        self.zoom(toItem: containers[initialIndex], whileDismissing: itemsToDismiss)
    }
    
    func performAnimation(fromIndex: Int,
                          toIndex: Int,
                          onAnimatedTabBar tabBar: UIView,
                          withContainers containers: [MDVTabBarContainer],
                          completion: @escaping () -> Void) {
        
        var itemsToDismiss = containers
        itemsToDismiss.remove(at: toIndex)
        
        self.zoom(toItem: containers[toIndex],
                  whileDismissing: itemsToDismiss)
        completion()
    }
    
    fileprivate func zoom(toItem enlargeItem: MDVTabBarContainer,
                          whileDismissing otherItems: [MDVTabBarContainer]) {
        
        enlargeItem.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        let _ = otherItems.map { item in
            item.transform = CGAffineTransform.identity
            item.setState(isSelected: true)
        }
        
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       usingSpringWithDamping: 4,
                       initialSpringVelocity: 1.0,
                       options: .allowUserInteraction,
                       animations: {
                        enlargeItem.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                        let _ = otherItems.map { item in
                            item.transform = CGAffineTransform(scaleX: 1, y: 1)
                            item.setState(isSelected: false)
                        }
            })
    }
}
