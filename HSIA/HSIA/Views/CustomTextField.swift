//
//  CustomTextField.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 27.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    
    fileprivate var padding: UIEdgeInsets!
    
    init() {
        super.init(frame: CGRect.zero)
        
        self.defaultTextAttributes = AttributedString.generate(type: .body1, weight: .medium, color: HSIAColor.labelPrimary.color)
        
        self.padding = .init(top: 11, left: 16 + 22 + 10, bottom: 11, right: 16 + 22 + 10)
        
        self.withSize(Sizing.tableViewAndTextFieldSize)
    }
    
    func setData(text: String?, placeholder: String?, keyboardType: UIKeyboardType = .default) {
        if let text = text {
            self.text = text
        }
        if let placeholder = placeholder {
            self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: AttributedString.generate(type: .body1, weight: .medium, color: HSIAColor.labelSecondary.color))
        }
        self.keyboardType = keyboardType
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
