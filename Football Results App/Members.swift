//
//  Members.swift
//  Football Results App
//
//  Created by mac on 21.06.2020.
//  Copyright © 2020 Oleg Stasiw. All rights reserved.
//

struct Members: Decodable {
    let name: String?
    let clubs: [Club?]
}

struct Club: Decodable {
    let key: String?
    let name: String?
    let code: String?
}
