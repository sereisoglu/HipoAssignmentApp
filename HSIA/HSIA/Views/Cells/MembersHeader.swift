//
//  MembersHeader.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 29.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit

class MembersHeader: UICollectionReusableView {
    
    fileprivate var tableViewHeader: HSIATableViewHeader!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableViewHeader = HSIATableViewHeader()
        tableViewHeader.addFillSuperview(superview: self)
    }
    
    func setData(headerText: String) {
        tableViewHeader.setData(headerText: headerText)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
