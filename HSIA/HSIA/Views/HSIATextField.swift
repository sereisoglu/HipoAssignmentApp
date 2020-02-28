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
    
    init() {
        super.init(frame: .zero)
        
        // Left View
        
        let leftView = UIView()
        
        icon = HSIAIcon(size: .pt22, icon: nil, tintColor: .labelPrimary)
        
        leftView.stack(
            icon, alignment: .trailing
        )
        // for ios11
        leftView.withSize(.init(width: Sizing.paddingTableViewAndTextField.left + 22, height: 22))
        // Text Field
        
        textField = CustomTextField()
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
            return allowedCharacters.isSuperset(of: characterSet)
        } else {
            return true
        }
    }
    
    func setData(iconName: HSIAIconName, text: String?, placeholder: String?, isJustNumber: Bool) {
        icon.setData(icon: iconName)
        if isJustNumber {
            self.isJustNumber = isJustNumber
            textField.setData(text: text, placeholder: placeholder, keyboardType: .numberPad)
        } else {
            textField.setData(text: text, placeholder: placeholder)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
