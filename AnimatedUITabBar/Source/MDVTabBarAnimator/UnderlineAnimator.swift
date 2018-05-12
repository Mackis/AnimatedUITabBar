//
//  UnderlineAnimator.swift
//  AnimatedUITabBar
//
//  Created by Malcolm Kumwenda on 2018/04/16.
//  Copyright © 2018 Malcolm Kumwenda. All rights reserved.
//

import UIKit

class UnderlineAnimator: MDVTabBarAnimatable {
    
    private let underlineColor: UIColor
    private let underlineHeight: CGFloat
    private let underlineWidth: CGFloat
    private let underlineOffsetY: CGFloat
    private var underlineView: UIView = UIView(frame: .zero)
    
    private let scale: CGFloat
    private let duration: Double
    private let delay: Double
    
    
    init(withUnderlineColor underlineColor: UIColor,
         underlineHeight: CGFloat,
         underlineWidth: CGFloat,
         underlineOffsetY: CGFloat,
         duration: Double,
         delay: Double,
         scale: CGFloat){
        self.underlineColor = underlineColor
        self.underlineHeight = underlineHeight
        self.underlineWidth = underlineWidth
        self.underlineOffsetY = underlineOffsetY
        self.scale = scale
        self.duration = duration
        self.delay = delay
    }
    
    func prepareForAnimation(onAnimatedTabBar tabBar: UIView, withContainers containers: [MDVTabBarContainer], andInitialIndex initialIndex: Int) {
        let xPosition = CGFloat(containers[initialIndex].frame.midX) - (self.underlineWidth/2)
        let yPosition = CGFloat(containers[initialIndex].frame.midY) + self.underlineOffsetY
        self.underlineView = UIView(frame: CGRect(x: xPosition,
                                                  y: yPosition,
                                                  width: self.underlineWidth,
                                                  height: self.underlineHeight))
        self.underlineView.backgroundColor = self.underlineColor
        self.underlineView.layer.cornerRadius = 1
        tabBar.insertSubview(self.underlineView, at: 0)
    }
    
    func performAnimation(fromIndex: Int,
                          toIndex: Int,
                          onAnimatedTabBar tabBar: UIView,
                          withContainers containers: [MDVTabBarContainer],
                          completion: @escaping () -> Void) {
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 4,
                       initialSpringVelocity: 2.0,
                       options: .curveLinear,
                       animations: {
                        let xPosition = CGFloat(containers[toIndex].frame.midX) - (self.underlineWidth/2)
                        let yPosition = CGFloat(containers[toIndex].frame.midY) + self.underlineOffsetY
                        self.underlineView.frame = CGRect(x: xPosition,
                                                          y: yPosition,
                                                          width: self.underlineWidth,
                                                          height: self.underlineHeight)
                        completion()
        })
    }
}
