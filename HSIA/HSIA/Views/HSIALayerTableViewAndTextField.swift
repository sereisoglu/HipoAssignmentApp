//
//  HSIALayerTableViewAndTextField.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 28.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit

class HSIALayerTableViewAndTextField: UIView {
    
    fileprivate var cornerRadius: CGFloat = 8.0
    
    fileprivate var shadowLayer: CAShapeLayer!
     
    override func layoutSubviews() {
        super.layoutSubviews()

        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            
            // Fill
            shadowLayer.fillColor = HSIAColor.groupedBackground.color.cgColor
            
            // Shadow
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
            shadowLayer.shadowColor = HSIAColor.shadow.color.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            shadowLayer.shadowOpacity = 1
            shadowLayer.shadowRadius = 4

            layer.insertSublayer(shadowLayer, at: 0)
        }
    }
    
    init() {
        super.init(frame: .zero)
        
        // Border
        self.layer.borderWidth = 1
        self.layer.borderColor = HSIAColor.border.color.cgColor
        self.layer.cornerRadius = cornerRadius
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
