//
//  MemberDetailTextFieldCell.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 29.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit

class MemberDetailTextFieldCell: UICollectionViewCell {
    
    fileprivate var textField: HSIATextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textField = HSIATextField()
        textField.addFillSuperview(superview: self)
    }
    
    func setData(iconName: HSIAIconName, text: String?, placeholder: String, isJustNumber: Bool) {
        textField.setData(iconName: iconName, text: text, placeholder: placeholder, isJustNumber: isJustNumber)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
