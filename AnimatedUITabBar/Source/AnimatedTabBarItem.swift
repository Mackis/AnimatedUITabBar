//
//  AnimatedTabBarItem.swift
//  AnimatedUITabBar
//
//  Created by Malcolm Kumwenda on 2018/04/17.
//  Copyright © 2018 Malcolm Kumwenda. All rights reserved.
//

import UIKit

class AnimatedTabBarItem: UIView {
    
    var iconView: UIImageView!
    private var image: UIImage!
    private var selectedImage: UIImage?
    private var selectedTintColor: UIColor!
    private var defaultTintColor: UIColor!
    
    override init (frame : CGRect) {
        super.init(frame : frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(withtabBarItem item: UITabBarItem,
                   selectedTintColor: UIColor,
                   defaultTintColor: UIColor) {
        
        guard let image = item.image else {
            fatalError("TabBar item has no image set.")
        }
        
        self.image = image
        self.selectedImage = item.selectedImage
        self.selectedTintColor = selectedTintColor
        self.defaultTintColor = defaultTintColor
      
        iconView = UIImageView(frame: CGRect(x: (self.frame.width-self.image.size.width)/2,
                                             y: (self.frame.height-self.image.size.height)/2,
                                             width: self.frame.width,
                                             height: self.frame.height))
        
        iconView.image = self.image
        iconView.sizeToFit()
        iconView.tintColor = self.defaultTintColor
        
        self.addSubview(iconView)
    }
    
    func setState(isSelected: Bool) {
        if isSelected {
            if let selectedImage = self.selectedImage {
                iconView.image = selectedImage
            }
        }else {
            iconView.image = image
        }
    }
    
}
