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
        
        leftIcon = HSIAIcon(size: .pt22, icon: nil, tintColor: .labelPrimary)
        label = HSIALabel(text: nil, type: .body1, weight: .medium, color: .labelPrimary)
        rightIcon = HSIAIcon(size: .pt22, icon: .chevronRight, tintColor: .labelPrimary)
        background = HSIALayerTableViewAndTextField()
        
        let labelWidth = Sizing.oneColumn - (Sizing.paddingTableViewAndTextField.left + 22 + 10 + 10 + 22 + Sizing.paddingTableViewAndTextField.right)
        
        background.addFillSuperview(superview: self)
        
        hstack(
            leftIcon,
            label.withWidth(labelWidth),
            rightIcon, spacing: 10
        ).withMargins(Sizing.paddingTableViewAndTextField)
    }
    
    func setData(leftIconName: HSIAIconName? = nil, text: String? = nil) {
        leftIcon.setData(icon: leftIconName)
        label.setData(text: text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
