//
//  AnimatedTabBar.swift
//  AnimatedUITabBar
//
//  Created by Malcolm Kumwenda on 2018/04/15.
//  Copyright © 2018 Malcolm Kumwenda. All rights reserved.
//

import UIKit
import SwiftIcons

protocol AnimatedUITabBarDelegate {
    func didSelect(viewController: ViewController)
}

class AnimatedUITabBar: UIView {
    
    public var animationDelegate: AnimatedUITabBarDelegate?
    public private(set) var selectedIndex: Int
    
    private var tabBarItemContainers = [UIView]()
    private var animatedTabBarItems = [AnimatedTabBarItem]()
    private let initialIndex: Int
    private let animator: UITabBarAnimatable
    private let tabBarItems: [UITabBarItem]
    
    init(withTabBarItems tabBarItems: [UITabBarItem],
         initialIndex: Int,
         usingAnimator animator: UITabBarAnimatable) {
        self.animator = animator
        self.initialIndex = initialIndex
        self.selectedIndex = initialIndex
        self.tabBarItems = tabBarItems
        super.init(frame: .zero)
        self.backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {
        let containerRects = self.createTabBarItems()
        self.createTabBarItems(usingContainerRects: containerRects)
    }
    
    private func createTabBarItems() -> [CGRect] {
        var rects = [CGRect]()
        for index in 0..<self.tabBarItems.count {
            let containerRect = self.createTabBarItemContainerRect(atIndex: index)
            rects.append(containerRect)
        }
        return rects
    }
    
    private func createTabBarItemContainerRect(atIndex index: Int) -> CGRect {
        let containerWidth = self.frame.width / CGFloat(self.tabBarItems.count)
        let containerHeight = self.frame.height
        let containerRect = CGRect(x: CGFloat(index)*containerWidth,
                                   y: 0,
                                   width: containerWidth,
                                   height: containerHeight)
        
        return containerRect
    }
    
    private func createTabBarItems(usingContainerRects rects: [CGRect]) {
        for index in 0..<self.tabBarItems.count {
            
            let containerRect = rects[index]
            
            let animatedTabBarItem = AnimatedTabBarItem(frame: containerRect)
            animatedTabBarItem.configure(withtabBarItem: self.tabBarItems[index],
                                         selectedTintColor: .blue,
                                         defaultTintColor: .blue)
            self.animatedTabBarItems.append(animatedTabBarItem)
            
            let tabBarButton = UIButton(frame: containerRect)
            tabBarButton.tag = index
            tabBarButton.addTarget(self,
                                   action: #selector(self.touchUpInsideForTabBarButton(sender:)),
                                   for: .touchUpInside)
           
            self.addSubview(animatedTabBarItem)
            self.addSubview(tabBarButton)
        }
    }
    
    @objc private func touchUpInsideForTabBarButton(sender: UIButton) {
        print(sender.tag)
    }
}
