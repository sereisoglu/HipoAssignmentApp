//
//  HSIATableViewFooter.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 1.03.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit
import LBTATools

class HSIATableViewFooter: UIView {
    
    fileprivate var label: HSIALabel!
    
    init() {
        super.init(frame: .zero)
        
        let labelWidth = Sizing.oneColumn - (Sizing.paddingTableViewAndTextField.left + Sizing.paddingTableViewAndTextField.right)
        
        label = HSIALabel(text: "There are no members in this team.", type: .body2, weight: .semibold, color: .labelSecondary)
        
        stack(
            label.withWidth(labelWidth), alignment: .center
        ).withMargins(Sizing.paddingTableViewAndTextField)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
