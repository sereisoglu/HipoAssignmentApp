//
//  HSIAIcon.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 27.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit
import LBTATools

enum IconName: String {
    case calendar
    case camera
    case chevronRight
    case github
    case hipo
    case map
    case name
    case person
    case team
}

class HSIAIcon: UIImageView {
    
    enum Size: CGFloat {
        case pt22
        case pt30
        
        var value: CGFloat {
            switch self {
            case .pt22:
                return Sizing.icon22pt
            case .pt30:
                return Sizing.icon30pt
            }
        }
    }
    
    init(size: Size, iconName: IconName?, tintColor: HSIAColor) {
        super.init(frame: .zero)
        
        self.withSize(.equalEdge(size.value))
        setData(iconName: iconName)
        self.tintColor = tintColor.color
    }
    
    func setData(iconName: IconName?) {
        if let iconName = iconName {
            self.image = UIImage(named: iconName.rawValue)?.withRenderingMode(.alwaysTemplate)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
