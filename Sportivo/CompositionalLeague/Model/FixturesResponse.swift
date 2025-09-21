//
//  FixtureModel.swift
//  Sportivo
//
//  Created by adham ragap on 21/09/2025.
//

import Foundation
struct FixturesResponse: Codable {
    let success: Int
    let result: [Match]?
}
struct Match: Codable {
    let event_key: Int
    let event_date: String
    let event_time: String
    let event_home_team: String
    let event_away_team: String
    let league_name: String
    let league_key: Int
    let home_team_logo: String?
    let away_team_logo: String?
    let event_final_result:String?
}

