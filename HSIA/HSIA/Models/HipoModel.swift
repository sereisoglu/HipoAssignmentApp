//
//  HipoModel.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 28.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import Foundation
import DifferenceKit

struct HipoModel: Codable {
    let company, team: String
    let members: [MemberModel]
}

struct MemberModel: Codable, Differentiable {
    let name, location, github: String
    let age: Int
    let hipo: InnerHipoModel
    
    var differenceIdentifier: String {
        return github
    }

    func isContentEqual(to source: MemberModel) -> Bool {
        return name == source.name
    }
}

struct InnerHipoModel: Codable {
    let position: String
    let yearsInHipo: Int

    enum CodingKeys: String, CodingKey {
        case position
        case yearsInHipo = "years_in_hipo"
    }
}
