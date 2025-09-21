//
//  StandingsResponse.swift
//  Sportivo
//
//  Created by adham ragap on 21/09/2025.
//

import Foundation
struct StandingsResponse :Codable {
    let result: StandingsResult
}
struct StandingsResult: Codable {
    let total: [Standing]
}

struct Standing: Codable {
    let standing_place: Int
    let standing_place_type: String
    let standing_team: String
    let standing_P: Int
    let standing_W: Int
    let standing_D: Int
    let standing_L: Int
    let standing_F: Int
    let standing_A: Int
    let standing_GD: Int
    let standing_PTS: Int
    let team_key: Int
    let league_key: Int
    let league_season: String
    let league_round: String
    let standing_updated: String
    let fk_stage_key: Int
    let stage_name: String
    let team_logo: String
    let standing_LP: Int
    let standing_WP: Int
}
