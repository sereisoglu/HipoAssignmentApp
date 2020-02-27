//
//  HSIATextField.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 27.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit
import LBTATools

class HSIATextField: UIView, UITextFieldDelegate {
    
    fileprivate var icon: HSIAIcon!
    
    fileprivate var textField: CustomTextField!
    
    init(iconName: HSIAIconName, text: String?, placeholder: String) {
        super.init(frame: .zero)
        
        // Left View
        
        let leftView = UIView()
        
        icon = HSIAIcon(size: .pt22, icon: iconName, tintColor: .labelPrimary)
        
        leftView.hstack(
            icon, alignment: .center
        ).padLeft(Sizing.paddingTableViewAndTextField.left)
        
        // Text Field
        
        textField = CustomTextField(text: text, placeholder: placeholder)
        
        textField.leftView = leftView
        textField.leftViewMode = .always
        
        textField.autocorrectionType = .no
        
        textField.addFillSuperview(superview: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
