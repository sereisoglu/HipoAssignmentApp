//
//  AttributedString.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 27.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit

enum HSIAFontType {
    case body1
    case body2
    
    var value: (size: CGFloat, lineHeight: CGFloat, kerning: CGFloat) {
        switch self {
            case .body1:
                return (size: 17.0, lineHeight: 22.0, kerning: -0.41)
            case .body2:
                return (size: 15.0, lineHeight: 20.0, kerning: -0.24)
        }
    }
}

enum HSIAFontWeight {
    case medium
    case semibold
    
    var value: UIFont.Weight {
        switch self {
            case .medium:
                return .medium
            case .semibold:
                return .semibold
        }
    }
}

struct AttributedString {
    
    static func generate(type: HSIAFontType,
                         weight: HSIAFontWeight,
                         color: UIColor? = nil,
                         alignment: NSTextAlignment = .left) -> [NSAttributedString.Key : Any] {
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.maximumLineHeight = type.value.lineHeight
        paragraphStyle.minimumLineHeight = type.value.lineHeight
        paragraphStyle.lineSpacing = 0.0
        paragraphStyle.alignment = alignment
        paragraphStyle.lineBreakMode = .byTruncatingTail
        
        var attrs: [NSAttributedString.Key : Any] = [
            .font: UIFont.systemFont(ofSize: type.value.size, weight: weight.value),
            .paragraphStyle: paragraphStyle,
            .kern: type.value.kerning,
            .baselineOffset: 0.5
        ]
        
        if let color = color {
            attrs[NSAttributedString.Key.foregroundColor] = color
        }
        
        return attrs
    }
}
