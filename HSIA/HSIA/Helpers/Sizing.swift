//
//  Sizing.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 27.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit

struct Sizing {
    
    // Global
    
    static let deviceSize: CGSize = UIScreen.main.bounds.size
    static let homeIndicatorHeight: CGFloat = 34
    
    static let isXDevice: Bool = {
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        if statusBarHeight == 44 {
            return true
        }
        return false
    }()
    
    static let oneColumn: CGFloat = deviceSize.width - (Sizing.space20pt + Sizing.space20pt)
    
    // Space
    
    static let space10pt: CGFloat = 10
    static let space11pt: CGFloat = 11
    static let space12pt: CGFloat = 12
    static let space16pt: CGFloat = 16
    static let space20pt: CGFloat = 20
    static let space45pt: CGFloat = 45
    
    // Icons
    
    static let icon22pt: CGFloat = 22
    static let icon30pt: CGFloat = 30
    
    // Corner Radius
    
    static let cornerRadius: CGFloat = 8
    
    // imageView
    
    static let imageView42ptSize: CGSize = .equalEdge(42)
    static let imageView100ptSize: CGSize = .equalEdge(100)
    
    // layerButtons
    
    static let oneButtonLayerHeight: CGFloat = {
        if isXDevice {
            return Sizing.space16pt + Sizing.buttonRectangleHeight + Sizing.homeIndicatorHeight
        }
        return Sizing.space16pt + Sizing.buttonRectangleHeight + Sizing.space16pt
    }()
    
    static let twoButtonsLayerHeight: CGFloat = {
        if isXDevice {
            return Sizing.space16pt + Sizing.buttonRectangleHeight + Sizing.space16pt + Sizing.buttonRectangleHeight + Sizing.homeIndicatorHeight
        }
        return Sizing.space16pt + Sizing.buttonRectangleHeight + Sizing.space16pt + Sizing.buttonRectangleHeight + Sizing.space16pt
    }()
    
    static let oneButtonCollectionViewBottomInset: CGFloat = {
        if isXDevice {
            return Sizing.space16pt + Sizing.buttonRectangleHeight + Sizing.space16pt
        }
        return Sizing.space16pt + Sizing.buttonRectangleHeight + Sizing.space16pt + Sizing.space16pt
    }()
    
    static let twoButtonsCollectionViewBottomInset: CGFloat = {
        if isXDevice {
            return Sizing.space16pt + Sizing.buttonRectangleHeight + Sizing.space16pt + Sizing.buttonRectangleHeight + Sizing.space16pt
        }
        return Sizing.space16pt + Sizing.buttonRectangleHeight + Sizing.space16pt + Sizing.buttonRectangleHeight + Sizing.space16pt + Sizing.space16pt
    }()
    
    // buttons
    
    static let buttonRectangleHeight: CGFloat = 50
    static let buttonCircleSize: CGSize = .equalEdge(44)
    
    // tableView and textField
    
    static let paddingTableViewAndTextField: UIEdgeInsets = .init(top: Sizing.space11pt, left: Sizing.space16pt, bottom: Sizing.space11pt, right: Sizing.space16pt)
    
    static let tableViewRowMediumAndTextFieldSize: CGSize = .init(width: Sizing.oneColumn, height: 44)
    static let tableViewRowLargeSize: CGSize = .init(width: Sizing.oneColumn, height: 84)
    static let tableViewRowHeaderAndFooterSize: CGSize = .init(width: Sizing.deviceSize.width, height: 42)
}
