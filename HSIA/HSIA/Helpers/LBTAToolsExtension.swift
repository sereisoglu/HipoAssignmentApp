//
//  LBTAToolsExtension.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 27.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit
import LBTATools

extension UIView {
    func addCenterInSuperview(superview: UIView, size: CGSize = .zero) {
        superview.addSubview(self)
        self.centerInSuperview(size: size)
    }
    
    open func addFillSuperview(superview: UIView,padding: UIEdgeInsets = .zero) {
        superview.addSubview(self)
        self.fillSuperview(padding: padding)
    }
}
