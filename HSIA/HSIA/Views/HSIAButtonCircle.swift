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
    
    init(iconName: HSIAIconName) {
        super.init(frame: CGRect.zero)
        
        self.layer.cornerRadius = 44 / 2
        self.clipsToBounds = true
        
        icon = HSIAIcon(size: .pt30, icon: iconName, tintColor: .labelWhite)
        
        blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
        
        self.withSize(.equalEdge(44))
        icon.addCenterInSuperview(superview: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
