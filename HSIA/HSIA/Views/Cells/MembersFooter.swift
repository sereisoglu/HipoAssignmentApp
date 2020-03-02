//
//  MembersFooter.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 1.03.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit

class MembersFooter: UICollectionReusableView {
    
    fileprivate var tableViewHeader: HSIATableViewFooter!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableViewHeader = HSIATableViewFooter()
        tableViewHeader.addCenterInSuperview(superview: self)
    }
    
    func setData(isHidden: Bool) {
        tableViewHeader.isHidden = isHidden
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

