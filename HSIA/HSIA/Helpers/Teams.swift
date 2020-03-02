//
//  Teams.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 2.03.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import Foundation

enum Teams: CaseIterable {
    case iOS
    case hardware
    case android
    case qaAutomation
    case webFrontend
    case backend
    
    var id: Int16 {
        switch self {
        case .iOS:
            return 1
        case .hardware:
            return 2
        case .android:
            return 3
        case .qaAutomation:
            return 4
        case .webFrontend:
            return 5
        case .backend:
            return 6
        }
    }
    
    var name: String {
        switch self {
        case .iOS:
            return "iOS Team"
        case .hardware:
            return "Hardware Team"
        case .android:
            return "Android Team"
        case .qaAutomation:
            return "QA Automation Team"
        case .webFrontend:
            return "Web Frontend Team"
        case .backend:
            return "Backend Team"
        }
    }
    
    static var allCasesNameArr: [String] {
        var arr = [String]()
        self.allCases.forEach {
            arr.append($0.name)
        }
        return arr
    }
}
