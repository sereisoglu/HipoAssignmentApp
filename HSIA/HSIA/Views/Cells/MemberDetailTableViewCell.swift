//
//  MemberDetailTableViewCell.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 29.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit

class MemberDetailTableViewCell: UICollectionViewCell {
    
    fileprivate var tableViewCell: HSIATableViewRowMedium!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableViewCell = HSIATableViewRowMedium()
        tableViewCell.addFillSuperview(superview: self)
    }
    
    func setData(iconName: HSIAIconName, text: String) {
        tableViewCell.setData(leftIconName: iconName, text: text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
