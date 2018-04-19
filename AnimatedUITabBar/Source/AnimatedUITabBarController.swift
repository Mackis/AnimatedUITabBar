//
//  AnimatedUITabBarController.swift
//  AnimatedUITabBar
//
//  Created by Malcolm Kumwenda on 2018/04/15.
//  Copyright © 2018 Malcolm Kumwenda. All rights reserved.
//

import UIKit
import SwiftIcons

enum ViewController: Int {
    case left, right, middle
}

class AnimatedUITabBarController: UITabBarController {
    
    //MARK:- Properties
    private var uiTabBar: AnimatedUITabBar!
    private let initialSelectedIndex: Int!
    
    //MARK:- Initialiser
    init(initialViewController index:ViewController) {
        self.initialSelectedIndex = index.rawValue
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewControllers()
        self.initialiseViews()
    }
    
    //MARK:- Private Methods
    private func setupViewControllers() {
        self.viewControllers = [LeftViewController(),
                                MiddleViewController(),
                                RightViewController()]
    }
    
    private func initialiseViews() {
        let uiTabBarAnimator = SlidingOverlayAnimator(withTabBarColors: [.yellow,
                                                                         .green,
                                                                         .blue])
        
        let leftTabBarItem = UITabBarItem()
        leftTabBarItem.image = UIImage.init(icon: .dripicon(.home),
                                            size: CGSize(width: 30, height: 30),
                                            textColor: .blue)
        leftTabBarItem.selectedImage = UIImage.init(icon: .dripicon(.home),
                                                    size: CGSize(width: 30, height: 30),
                                                    textColor: .blue,
                                                    backgroundColor: .blue)

        
        self.uiTabBar = AnimatedUITabBar(withTabBarItems: [leftTabBarItem,
                                                       leftTabBarItem,
                                                       leftTabBarItem,
                                                       leftTabBarItem],
                                         initialIndex: 0,
                                         usingAnimator: uiTabBarAnimator)
        
        self.view.addSubview(uiTabBar)
        self.setupUITabBarConstraints(withHeightOf: 50)
        self.uiTabBar.configure()
        self.uiTabBar.animationDelegate = self
        self.tabBar.isHidden = true
        
        
        
    }
    
    private func setupUITabBarConstraints(withHeightOf height: CGFloat) {
        self.uiTabBar.translatesAutoresizingMaskIntoConstraints = false
        self.uiTabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.uiTabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.uiTabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.uiTabBar.heightAnchor.constraint(equalToConstant: height).isActive = true
        if #available(iOS 11.0, *) {
            let bottomView = UIView(frame: .zero)
            self.view.addSubview(bottomView)
            bottomView.translatesAutoresizingMaskIntoConstraints = false
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            bottomView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        }
        self.view.layoutIfNeeded()
    }
}

extension AnimatedUITabBarController: AnimatedUITabBarDelegate {
    func didSelect(viewController toIndex: ViewController) {
        self.selectedIndex = toIndex.rawValue
    }
}
