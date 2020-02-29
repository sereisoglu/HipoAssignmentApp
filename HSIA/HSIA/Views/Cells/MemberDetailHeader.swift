//
//  MemberDetailHeader.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 29.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit

class MemberDetailHeader: UICollectionReusableView {
    
    var delegate: HSIATableViewRowImageSelectDelegate? {
        didSet {
            tableViewCell.delegate = delegate
        }
    }
    
    fileprivate var tableViewCell: HSIATableViewRowImageSelect!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableViewCell = HSIATableViewRowImageSelect()
        tableViewCell.addCenterInSuperview(superview: self)
    }
    
    func setData(image: UIImage?, text: String) {
        tableViewCell.setData(image: image, text: text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
