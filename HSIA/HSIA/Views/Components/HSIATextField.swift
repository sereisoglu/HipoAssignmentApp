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
    
    fileprivate var isJustNumber: Bool = false
    
    fileprivate var icon: HSIAIcon!
    fileprivate var textField: CustomTextField!
    fileprivate var background: HSIALayerTableViewAndTextField!
    
    init(iconName: IconName, placeholder: String, keyboardType: UIKeyboardType = .default) {
        super.init(frame: .zero)
        
        // Left View
        
        let leftView = UIView()
        
        icon = HSIAIcon(size: .pt22, iconName: iconName, tintColor: .labelPrimary)
        
        leftView.stack(
            icon, alignment: .trailing
        )
        // for ios11
        leftView.withSize(.init(width: Sizing.paddingTableViewAndTextField.left + Sizing.icon22pt, height: Sizing.icon22pt))
        
        // Text Field
        
        textField = CustomTextField()
        textField.setData(placeholder: placeholder)
        textField.keyboardType = keyboardType
        if keyboardType == .numberPad {
            isJustNumber = true
        }
        textField.delegate = self
        
        background = HSIALayerTableViewAndTextField()
        
        textField.leftView = leftView
        textField.leftViewMode = .always
        
        textField.autocorrectionType = .no
        
        background.addFillSuperview(superview: self)
        textField.addFillSuperview(superview: self)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if isJustNumber {
            let allowedCharacters = CharacterSet.decimalDigits
            let characterSet = CharacterSet(charactersIn: string)
            let length = (textField.text?.count ?? 0) + string.count - range.length
            // Maximum 3 characters and only decimal characters
            return allowedCharacters.isSuperset(of: characterSet) && length < 4
        } else {
            return true
        }
    }
    
    func setData(text: String?) {
        textField.setData(text: text)
    }
    
    func getData() -> String? {
        return textField.text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
