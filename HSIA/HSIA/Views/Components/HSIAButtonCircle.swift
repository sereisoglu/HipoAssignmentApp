//
//  HSIAButtonCircle.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 27.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit
import LBTATools

class HSIAButtonCircle: UIButton {
    
    fileprivate var icon: HSIAIcon!
    fileprivate var blurEffectView: UIVisualEffectView!
    
    init(iconName: IconName) {
        super.init(frame: CGRect.zero)
        
        self.layer.cornerRadius = Sizing.buttonCircleSize.width / 2
        self.clipsToBounds = true
        
        icon = HSIAIcon(size: .pt30, iconName: iconName, tintColor: .labelWhite)
        
        blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
        
        self.withSize(Sizing.buttonCircleSize)
        icon.addCenterInSuperview(superview: self)
        
        icon.isUserInteractionEnabled = false
        blurEffectView.isUserInteractionEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
