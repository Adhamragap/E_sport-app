//
//  LeaguePresenter.swift
//  Sportivo
//
//  Created by adham ragap on 18/09/2025.
//

import Foundation
protocol SendLeagueToViewProtocol {
    func sendLeague(league:League)
}
class LeaguePresenter {
  //  var leagueName:String =
    var sendLeagueToViewDelegete:SendLeagueToViewProtocol?
    init (sendLeagueToView:SendLeagueToViewProtocol){
        self.sendLeagueToViewDelegete = sendLeagueToView
    }
    func getDataFromRemote (){
        ApiHandler.getData(url:"https://apiv2.allsportsapi.com/\(Session.leagueType)/?met=Leagues&APIkey=5ed2112ca25316743af4065ed4ab3866ed11bd08555311178237e77ea1e46342") { [weak self]( league:League?, error ) in
                   guard let league = league else {
                       return
                   }
            self?.sendLeagueToViewDelegete?.sendLeague(league: league)
                   if let error = error {
                       print(error.localizedDescription)
                   }
                 
               }
    }
}
