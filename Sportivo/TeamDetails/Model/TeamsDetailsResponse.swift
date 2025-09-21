//
//  TeamsDetailsResponse.swift
//  Sportivo
//
//  Created by adham ragap on 21/09/2025.
//

import Foundation
struct TeamDetailsResponse: Codable {
    let success: Int
    let result: [Team]
   
}
struct Team: Codable {
    let team_key: Int
    let team_name: String
    let team_logo: String
    let players: [Player]
    let coaches:[Coaches]
}
struct Player:Codable {
    var player_image:String?
    var  player_name:String?
    var player_number:String?
    var player_type: String?
    var player_age:String?
    var player_birthdate:String?
    var player_goals:String?
}
struct Coaches:Codable{
    var coach_name:String?
}
