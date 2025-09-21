//
//  TeamsPresenter.swift
//  Sportivo
//
//  Created by adham ragap on 21/09/2025.
//

import Foundation
protocol TeamsPresenterProtocol{
   func sendTeam(team:TeamDetailsResponse)
}
class TeamsPresenter {
    var TeamsPresenterDelegete:TeamsPresenterProtocol?
    init(delegte:TeamsPresenterProtocol){
        self.TeamsPresenterDelegete = delegte
    }
    func getTeamsFromApi (){
        let url = "https://apiv2.allsportsapi.com/\(Session.leagueType)/?&met=Teams&teamId=\(Session.teamKey)&APIkey=5ed2112ca25316743af4065ed4ab3866ed11bd08555311178237e77ea1e46342"
        ApiHandler.getData(url: url) { (data:TeamDetailsResponse?, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            guard let data = data else {
                return
            }
            self.TeamsPresenterDelegete?.sendTeam(team: data)
        }
    }
}
