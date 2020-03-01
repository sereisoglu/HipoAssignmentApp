//
//  HipoModel.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 28.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import Foundation

struct HipoModel: Decodable {
    let company, team: String
    let members: [MemberModel]
}

struct MemberModel: Decodable {
    let name, location, github: String
    let age: Int
    let hipo: InnerHipoModel
}

struct InnerHipoModel: Decodable {
    let position: String
    let yearsInHipo: Int

    enum CodingKeys: String, CodingKey {
        case position
        case yearsInHipo = "years_in_hipo"
    }
}
