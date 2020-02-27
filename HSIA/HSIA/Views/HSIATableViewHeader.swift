//
//  HSIATableViewHeader.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 27.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit
import LBTATools

class HSIATableViewHeader: UIView {
    
    fileprivate var label: HSIALabel!
    
    init(text: String) {
        super.init(frame: .zero)
        
        let labelWidth = Sizing.oneColumn - (Sizing.paddingTableViewAndTextField.left + Sizing.paddingTableViewAndTextField.right)
        
        label = HSIALabel(text: text.uppercased(), type: .body2, weight: .semibold, color: .labelPrimary)
        
        stack(
            label.withWidth(labelWidth), alignment: .center
        ).withMargins(Sizing.paddingTableViewAndTextField)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
