//
//  HSIAIcon.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 27.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit
import LBTATools

enum HSIAIconName: String {
    case calendar
    case camera
    case chevronRight
    case github
    case map
    case name
    case person
    case team
}

class HSIAIcon: UIImageView {
    
    enum Size: CGFloat {
        case pt22 = 22
        case pt30 = 30
    }
    
    init(size: Size, icon: HSIAIconName?, tintColor: HSIAColor?) {
        super.init(frame: .zero)
        
        self.withSize(.equalEdge(size.rawValue))
        
        setData(icon: icon, color: tintColor)
    }
    
    func setData(icon: HSIAIconName? = nil, color: HSIAColor? = nil) {
        if let icon = icon {
            self.image = UIImage(named: icon.rawValue)?.withRenderingMode(.alwaysTemplate)
        }
        if let color = color {
            self.tintColor = color.color
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
