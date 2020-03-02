//
//  HSIATableViewRowMedium.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 27.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit
import LBTATools

class HSIATableViewRowMedium: UIView {
    
    fileprivate var leftIcon: HSIAIcon!
    fileprivate var label: HSIALabel!
    fileprivate var rightIcon: HSIAIcon!
    fileprivate var background: HSIALayerTableViewAndTextField!
    
    init() {
        super.init(frame: .zero)
        
        leftIcon = HSIAIcon(size: .pt22, iconName: nil, tintColor: .labelPrimary)
        label = HSIALabel(text: nil, type: .body1, weight: .medium, color: .labelPrimary)
        rightIcon = HSIAIcon(size: .pt22, iconName: .chevronRight, tintColor: .labelPrimary)
        background = HSIALayerTableViewAndTextField()
        
        let labelWidth = Sizing.oneColumn - (Sizing.paddingTableViewAndTextField.left + Sizing.icon22pt + Sizing.space10pt + Sizing.space10pt + Sizing.icon22pt + Sizing.paddingTableViewAndTextField.right)
        
        background.addFillSuperview(superview: self)
        
        hstack(
            leftIcon,
            label.withWidth(labelWidth),
            rightIcon, spacing: Sizing.space10pt
        ).withMargins(Sizing.paddingTableViewAndTextField)
    }
    
    func setData(leftIconName: IconName? = nil, text: String? = nil) {
        leftIcon.setData(iconName: leftIconName)
        label.setData(text: text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
