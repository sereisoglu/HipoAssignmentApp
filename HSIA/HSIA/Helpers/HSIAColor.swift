//
//  UIColorExtension.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 27.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit

enum HSIAColor {
    case brand
    case labelPrimary
    case labelSecondary
    case labelWhite
    case buttonPrimary
    case buttonSecondary
    case backgroundPrimary
    case backgroundSecondary
    case groupedBackground
    case border
    case shadow
    
    var color: UIColor {
        switch self {
        case .brand:
            return .init(red: 227/255, green: 28/255, blue: 55/255, alpha: 1)
        case .labelPrimary:
            return .init(white: 0.0, alpha: 1)
        case .labelSecondary:
            return .init(white: 0.5, alpha: 1)
        case .labelWhite:
            return .white
        case .buttonPrimary:
            return .init(red: 43/255, green: 49/255, blue: 55/255, alpha: 1)
        case .buttonSecondary:
            return .init(red: 45/255, green: 186/255, blue: 78/255, alpha: 1)
        case .backgroundPrimary:
            return .white
        case .backgroundSecondary:
            return .init(white: 0.85, alpha: 1.0)
        case .groupedBackground:
            return .init(red: 250/255, green: 251/255, blue: 252/255, alpha: 1)
        case .border:
            return .init(red: 232/255, green: 232/255, blue: 235/255, alpha: 1)
        case .shadow:
            return .init(red: 233/255, green: 233/255, blue: 241/255, alpha: 1)
        }
    }
}
