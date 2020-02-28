//
//  HSIALabel.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 27.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit

class HSIALabel: UILabel {
    
    override var text: String? {
        didSet {
            setData(text: text)
        }
    }
    fileprivate var attrs: [NSAttributedString.Key : Any]!
    
    init(text: String?, type: HSIAFontType, weight: HSIAFontWeight, color: HSIAColor?, alignment: NSTextAlignment = .left, numberOfLines: Int = 1) {
        super.init(frame: .zero)
        
        attrs = AttributedString.generate(type: type, weight: weight, alignment: alignment)
        self.numberOfLines = numberOfLines
        
        self.text = text
        self.textColor = color?.color
        
        self.sizeToFit()
    }
    
    func setData(text: String? = nil, color: HSIAColor? = nil) {
        if let text = text {
            self.attributedText = NSMutableAttributedString(string: text, attributes: attrs)
        }
        if let color = color {
            self.textColor = color.color
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
