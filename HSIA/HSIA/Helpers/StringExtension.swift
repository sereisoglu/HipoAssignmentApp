//
//  StringExtension.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 27.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import Foundation

extension String {
    public func getAcronyms() -> String {
        let acronyms = components(separatedBy: " ").map{
            guard let firstLetter = $0.first else { return "" }
            return String(firstLetter)
        }.joined()
        
        return acronyms.uppercased()
    }
}
