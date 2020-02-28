//
//  Sizing.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 27.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit

struct Sizing {
    
    static let deviceSize: CGSize = UIScreen.main.bounds.size
    
    static let isXDevice: Bool = {
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        if statusBarHeight == 44 {
            return true
        }
        return false
    }()
    
    static let oneButtonLayerHeight: CGFloat = {
        if isXDevice {
            return 16 + 50 + 34
        }
        return 16 + 50 + 16
    }()
    
    static let twoButtonsLayerHeight: CGFloat = {
        if isXDevice {
            return 16 + 50 + 16 + 50 + 34
        }
        return 16 + 50 + 16 + 50 + 16
    }()
    
    static let oneButtonCollectionViewBottomInset: CGFloat = {
        if isXDevice {
            return 16 + 50 + 16
        }
        return 16 + 50 + 16 + 16
    }()
    
    static let twoButtonsCollectionViewBottomInset: CGFloat = {
        if isXDevice {
            return 16 + 50 + 16 + 50 + 16
        }
        return 16 + 50 + 16 + 50 + 16 + 16
    }()
    
    static let space11pt: CGFloat = 11
    static let space16pt: CGFloat = 16
    static let space20pt: CGFloat = 20
    
    static let oneColumn: CGFloat = deviceSize.width - (Sizing.space20pt + Sizing.space20pt)
    
    static let tableViewAndTextFieldSize: CGSize = .init(width: Sizing.oneColumn, height: 44)
    
    static let paddingTableViewAndTextField: UIEdgeInsets = .init(top: Sizing.space11pt, left: Sizing.space16pt, bottom: Sizing.space11pt, right: Sizing.space16pt)
}
