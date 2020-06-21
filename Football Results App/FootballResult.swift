//
//  FootballResult.swift
//  Football Results App
//
//  Created by mac on 21.06.2020.
//  Copyright © 2020 Oleg Stasiw. All rights reserved.
//

struct FootballResult: Decodable {
    let name: String?
    let rounds: [Round?]
}

struct Round: Decodable {
    let name: String?
    let matches: [Match?]
}

struct Match: Decodable {
    let date: String?
    let team1: Team?
    let team2: Team?
    let score1: Int?
    let score2: Int?
}

struct Team: Decodable{
    let key: String?
    let name: String?
    let code: String?
}
