//
//  HSIATableViewRowLarge.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 27.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit
import LBTATools

class HSIATableViewRowLarge: UIView {
    
    fileprivate var imageView: HSIAImageView!
    fileprivate var label: HSIALabel!
    fileprivate var sublabel: HSIALabel!
    fileprivate var icon: HSIAIcon!
    fileprivate var background: HSIALayerTableViewAndTextField!
    
    init() {
        super.init(frame: .zero)
        
        imageView = HSIAImageView(size: .pt42)
        label = HSIALabel(text: nil, type: .body1, weight: .medium, color: .labelPrimary)
        sublabel = HSIALabel(text: nil, type: .body2, weight: .medium, color: .labelSecondary)
        icon = HSIAIcon(size: .pt22, icon: .chevronRight, tintColor: .labelPrimary)
        background = HSIALayerTableViewAndTextField()
        
        let labelWidth = Sizing.oneColumn - (Sizing.paddingTableViewAndTextField.left + 42 + 10 + 10 + 22 + Sizing.paddingTableViewAndTextField.right)
        
        background.addFillSuperview(superview: self)
        
        hstack(
            imageView,
            hstack(
                stack(
                    label,
                    sublabel
                ).withWidth(labelWidth),
                hstack(
                    icon, alignment: .center
                ), spacing: 10
            ), spacing: 10
        ).withMargins(Sizing.paddingTableViewAndTextField)
    }
    
    func setData(image: UIImage?, text: String, subText: String) {
        if let image = image {
            imageView.setData(image: image)
        } else {
            imageView.setData(name: text)
        }
        label.setData(text: text)
        sublabel.setData(text: subText)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
