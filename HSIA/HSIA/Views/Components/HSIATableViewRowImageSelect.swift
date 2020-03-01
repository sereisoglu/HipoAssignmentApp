//
//  HSIATableViewRowImageSelect.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 27.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit
import LBTATools

protocol HSIATableViewRowImageSelectDelegate {
    func handleButton()
}

class HSIATableViewRowImageSelect: UIView {
    
    var delegate: HSIATableViewRowImageSelectDelegate?
    
    fileprivate var button: HSIAButtonCircle!
    fileprivate var imageView: HSIAImageView!
    fileprivate var background: HSIALayerTableViewAndTextField!
    
    init() {
        super.init(frame: .zero)
        
        button = HSIAButtonCircle(iconName: .camera)
        imageView = HSIAImageView(size: .pt100)
        background = HSIALayerTableViewAndTextField()
        
        background.addFillSuperview(superview: self)
        
        stack(
            imageView, alignment: .center
        ).withMargins(Sizing.paddingTableViewAndTextField)
        
        button.addCenterInSuperview(superview: self)
        
        button.addTarget(self, action: #selector(handleButton), for: .primaryActionTriggered)
    }
    
    @objc fileprivate func handleButton() {
        delegate?.handleButton()
    }
    
    func setData(name: String?, imageData: Data?) {
        imageView.setData(name: name, imageData: imageData)
    }
    
    func getData() -> UIImage? {
        return imageView.getData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
