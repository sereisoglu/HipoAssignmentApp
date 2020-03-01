//
//  MembersCell.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 29.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit

class MembersCell: UICollectionViewCell {
    
    fileprivate var tableViewCell: HSIATableViewRowLarge!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableViewCell = HSIATableViewRowLarge()
        tableViewCell.addFillSuperview(superview: self)
    }
    
    func setData(imageData: Data?, text: String, subText: String) {
        tableViewCell.setData(imageData: imageData, text: text, subText: subText)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
