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
    case buttonTertiary
    case backgroundPrimary
    case backgroundSecondary
    case groupedBackground
    case border
    case shadow
    
    var color: UIColor {
        switch self {
        case .brand:
            return .init(red: 227.0 / 255.0, green: 28.0 / 255.0, blue: 55.0 / 255.0, alpha: 1)
        case .labelPrimary:
            return .init(white: 0.0, alpha: 1)
        case .labelSecondary:
            return .init(white: 0.5, alpha: 1)
        case .labelWhite:
            return .white
        case .buttonPrimary:
            return .init(red: 43.0 / 255.0, green: 49.0 / 255.0, blue: 55.0 / 255.0, alpha: 1)
        case .buttonSecondary:
            return .init(red: 45.0 / 255.0, green: 186.0 / 255.0, blue: 78.0 / 255.0, alpha: 1)
        case .buttonTertiary:
            return UIColor(red: 255.0 / 255.0, green: 59.0 / 255.0, blue: 48.0 / 255.0, alpha: 1.0)
        case .backgroundPrimary:
            return .white
        case .backgroundSecondary:
            return .init(white: 0.85, alpha: 1.0)
        case .groupedBackground:
            return .init(red: 250.0 / 255.0, green: 251.0 / 255.0, blue: 252.0 / 255.0, alpha: 1)
        case .border:
            return .init(red: 232.0 / 255.0, green: 232.0 / 255.0, blue: 235.0 / 255.0, alpha: 1)
        case .shadow:
            return .init(red: 233.0 / 255.0, green: 233.0 / 255.0, blue: 241.0 / 255.0, alpha: 1)
        }
    }
}
