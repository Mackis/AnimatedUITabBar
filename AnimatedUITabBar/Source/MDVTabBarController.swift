//
//  AnimatedUITabBarController.swift
//  AnimatedUITabBar
//
//  Created by Malcolm Kumwenda on 2018/04/15.
//  Copyright © 2018 Malcolm Kumwenda. All rights reserved.
//

import UIKit
import SwiftIcons

public class MDVTabBarController: UITabBarController {
    
    //MARK:- Properties
    public var mdvDataSource: MDVTabBarControllerDataSource? {
        didSet {
            self.configureViews()
        }
    }
    public var mdvDelegate : MDVTabBarControllerDelegate?
    private var mdvTabBar: MDVTabBar!
    
    //MARK:- Initialiser
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
    
    //MARK:- Private Methods
    private func configureViews() {
        guard let dataSource = self.mdvDataSource else { return }
        tabBar.isHidden = true
        viewControllers = dataSource.tabBarControllerViewControllers()
        mdvTabBar = MDVTabBar(withInitialIndex: dataSource.tabBarControllerInitialIndex(),
                              backgroundColor: dataSource.tabBarBackgroundColor())
        
        view.addSubview(mdvTabBar)
        setupUITabBarConstraints(withHeightOf: dataSource.tabBarHeight())
        
        mdvTabBar.dataSource = self
        mdvTabBar.delegate = self
    }
    
    private func setupUITabBarConstraints(withHeightOf height: CGFloat) {
        mdvTabBar.translatesAutoresizingMaskIntoConstraints = false
        mdvTabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mdvTabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mdvTabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        mdvTabBar.heightAnchor.constraint(equalToConstant: height).isActive = true
        if #available(iOS 11.0, *) {
            let bottomView = UIView(frame: .zero)
            bottomView.backgroundColor = mdvTabBar.backgroundColor
            view.addSubview(bottomView)
            bottomView.translatesAutoresizingMaskIntoConstraints = false
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            bottomView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        }
        self.view.layoutIfNeeded()
    }
}

extension MDVTabBarController: MDVTabBarDelegate, MDVTabBarDataSource {
    func mdvTabBarAnimator() -> MDVTabBarAnimatable {
        guard let dataSource = mdvDataSource else { fatalError() }
        return dataSource.tabBarAnimator()
    }
    
    func mdvTabBarItems() -> [UITabBarItem] {
        guard let dataSource = mdvDataSource else { fatalError() }
        return dataSource.tabBarControllerViewControllers().map({ $0.mdvTabBarItem() })
    }
    
    func didSelect(tabAtIndex toIndex: Int) {
        selectedIndex = toIndex
        mdvDelegate?.tabBar(self, didSelectIndex: selectedIndex)
    }
}
