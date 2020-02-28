//
//  HSIAButtonRectangle.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 27.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit
import LBTATools

class HSIAButtonRectangle: UIButton {
    
    enum `Type` {
        case primary
        case secondary
        case tertiary
        
        var backgroundColor: UIColor {
            switch self {
            case .primary:
                return HSIAColor.buttonPrimary.color
            case .secondary:
                return HSIAColor.buttonSecondary.color
            case .tertiary:
                return HSIAColor.buttonTertiary.color
            }
        }
    }
    
    fileprivate var label: HSIALabel!
    
    init(text: String, type: Type) {
        super.init(frame: CGRect.zero)
        
        self.layer.cornerRadius = 50 / 2
        self.clipsToBounds = true
        self.backgroundColor = type.backgroundColor
        
        label = HSIALabel(text: text.uppercased(), type: .body2, weight: .medium, color: .labelWhite, alignment: .center)
        label.isUserInteractionEnabled = false
        
        self.withHeight(50)
        label.addCenterInSuperview(superview: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
