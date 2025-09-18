//
//  League.swift
//  Sportivo
//
//  Created by adham ragap on 18/09/2025.
//

import Foundation
struct League : Codable {
    var result:[LeagueItem]
}
struct LeagueItem :Codable {
    var league_key:Int
    var league_name:String
    var league_logo:String?
}
