//
//  StringExtension.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 27.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import Foundation

extension String {
    func getAcronyms() -> String {
        let acronyms = components(separatedBy: " ").map{
            guard let firstLetter = $0.first else { return "" }
            return String(firstLetter)
        }.joined()
        return acronyms.uppercased()
    }
    
    func countNumberOfOccurrencesOfCharacter(char: String) -> Int {
        let chars = self.lowercased().filter {
            $0 == Character(String(char).lowercased())
        }
        return chars.count
    }
    
    func findLastName() -> String {
        let trimmedName = self.trimmingCharacters(in: .whitespacesAndNewlines)
        let separatedName = trimmedName.components(separatedBy: " ")
        return separatedName.last ?? ""
    }
}
