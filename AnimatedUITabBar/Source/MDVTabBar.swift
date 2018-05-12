//
//  AnimatedTabBar.swift
//  AnimatedUITabBar
//
//  Created by Malcolm Kumwenda on 2018/04/15.
//  Copyright © 2018 Malcolm Kumwenda. All rights reserved.
//

import UIKit
import SwiftIcons


class MDVTabBar: UIView {
    
    //MARK:- Public Properties
    var delegate: MDVTabBarDelegate?
    var dataSource: MDVTabBarDataSource? {
        didSet {
            self.configure()
        }
    }
    
    //MARK:- Private Properties
    private(set) var tabBarItems = [UITabBarItem]()
    private(set) var selectedIndex: Int
    private(set) var initialIndex: Int
    private var tabBarItemContainers = [UIView]()
    private var animatedTabBarItems = [MDVTabBarItem]()
    
    //MARK:- Initialiser
    init(withInitialIndex initialIndex: Int,
         backgroundColor: UIColor) {
        self.initialIndex = initialIndex
        self.selectedIndex = initialIndex
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Private Methods
    private func configure() {
        guard let dataSource = dataSource else {
            return
        }
        tabBarItems = dataSource.mdvTabBarItems()
        let containerRects = createTabBarItems()
        createTabBarItems(usingContainerRects: containerRects)
        dataSource.mdvTabBarAnimator().prepareForAnimation(onAnimatedTabBar: self,
                                          withContainers: animatedTabBarItems,
                                          andInitialIndex: initialIndex)
        changeIconState(forIndex: self.initialIndex)
    }
    
    private func createTabBarItems() -> [CGRect] {
        var rects = [CGRect]()
        for index in 0..<tabBarItems.count {
            let containerRect = createTabBarItemContainerRect(atIndex: index)
            rects.append(containerRect)
        }
        return rects
    }
    
    private func createTabBarItemContainerRect(atIndex index: Int) -> CGRect {
        let containerWidth = frame.width / CGFloat(tabBarItems.count)
        let containerHeight = frame.height
        let containerRect = CGRect(x: CGFloat(index)*containerWidth,
                                   y: 0,
                                   width: containerWidth,
                                   height: containerHeight)
        
        return containerRect
    }
    
    private func createTabBarItems(usingContainerRects rects: [CGRect]) {
        for index in 0..<tabBarItems.count {
            
            let containerRect = rects[index]
            
            let animatedTabBarItem = MDVTabBarItem(frame: containerRect)
            animatedTabBarItem.configure(withtabBarItem: tabBarItems[index])
            animatedTabBarItems.append(animatedTabBarItem)
            
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
        guard let dataSource = dataSource else { return }
        dataSource.mdvTabBarAnimator().performAnimation(fromIndex: selectedIndex,
                                       toIndex: sender.tag,
                                       onAnimatedTabBar: self,
                                       withContainers: animatedTabBarItems) {
                                        guard self.selectedIndex != sender.tag else { return }
                                        self.changeIconState(forIndex: sender.tag)
        }
    }
    
    private func changeIconState(forIndex index: Int) {
        self.animatedTabBarItems[index].setState(isSelected: true)
        self.animatedTabBarItems[self.selectedIndex].setState(isSelected: false)
        self.selectedIndex = index
        self.delegate?.didSelect(tabAtIndex: index)
    }
}
