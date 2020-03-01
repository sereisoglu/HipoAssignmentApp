//
//  HSIAImageView.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 27.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit
import LBTATools

class HSIAImageView: UIView {
    
    enum Size {
        case pt42
        case pt100
        
        var value: CGSize {
            switch self {
                case .pt42:
                    return .equalEdge(42)
                case .pt100:
                    return .equalEdge(100)
            }
        }
    }
    
    fileprivate var label: HSIALabel!
    fileprivate var background: UIView!
    fileprivate var imageView: UIImageView!
    
    init(size: Size) {
        super.init(frame: CGRect.zero)
        
        self.layer.cornerRadius = size.value.width / 2
        self.clipsToBounds = true
        
        background = UIView(backgroundColor: HSIAColor.backgroundSecondary.color)
        label = HSIALabel(text: nil, type: .body2, weight: .semibold, color: .labelSecondary, alignment: .center)
        imageView = UIImageView(image: nil, contentMode: .scaleAspectFill)
        
        let defaultSize = Size.pt42.value
        let aspectRatio = size.value.width / defaultSize.width
        background.withSize(defaultSize)
        background.transform = CGAffineTransform(scaleX: aspectRatio, y: aspectRatio)
        
        self.withSize(size.value)
        background.addCenterInSuperview(superview: self)
        label.addCenterInSuperview(superview: background)
        imageView.addFillSuperview(superview: self)
    }
    
    func setData(name: String?, imageData: Data?) {
        if let name = name {
            imageView.isHidden = true
            label.setData(text: String(name.getAcronyms().prefix(3)))
        }
        if let imageData = imageData {
            imageView.isHidden = false
            imageView.image = UIImage(data: imageData)
        }
    }
    
    func getData() -> UIImage? {
        return imageView.image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
