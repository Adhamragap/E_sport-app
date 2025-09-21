//
//  FixtureLeaguePresenter.swift
//  Sportivo
//
//  Created by adham ragap on 21/09/2025.
//

import Foundation
protocol FixtureLeaguePresenterProtocol{
    func didReceiveUpcomingFixtures(fixtureResponse:FixturesResponse)
    func didReceiveLatestFixtures(fixtureResponse: FixturesResponse)
    func didRecieveStandings(standingsResponse:StandingsResponse)
}
class FixtureLeaguePresenter {
    var delegete:FixtureLeaguePresenterProtocol?
    init (delegete:FixtureLeaguePresenterProtocol){
        self.delegete = delegete
    }
    func getDateToday()-> String {
        let formater = DateFormatter()
        formater.dateFormat = "yyyy-MM-dd"
        let todayDate = formater.string(from: Date())
        return todayDate
    }
    
//    func getDateAfter8Day ()->String {
//        guard let dateAfter8 = Calendar.current.date(byAdding: .day, value: 8, to: Date()) else {return ""}
//        let formater = DateFormatter()
//        formater.dateFormat = "yyyy-MM-dd"
//         return formater.string(from: dateAfter8)
//    }
//    func getDateBefore8Day ()->String {
//        guard let dateAfter8 = Calendar.current.date(byAdding: .day, value: -8, to: Date()) else {return ""}
//        let formater = DateFormatter()
//        formater.dateFormat = "yyyy-MM-dd"
//         return formater.string(from: dateAfter8)
//    }
    /// for dynamic date depend on the value you will put
    func getDateAfterNumberDays(value:Int)-> String{
        guard let dateDependOnValue = Calendar.current.date(byAdding: .day, value: value, to: Date()) else {return ""}
        let formater = DateFormatter()
        formater.dateFormat = "yyyy-MM-dd"
         return formater.string(from: dateDependOnValue)
    }
    
    func getUpComingFixtureDataFromModel(){
        let url = "https://apiv2.allsportsapi.com/\(Session.leagueType)/?met=Fixtures&APIkey=5ed2112ca25316743af4065ed4ab3866ed11bd08555311178237e77ea1e46342&leagueId=\(Session.leagueKey)&from=\(getDateToday())&to=\(getDateAfterNumberDays(value: 8))"
        ApiHandler.getData(url:url ) { (fixtureData:FixturesResponse?,error ) in
            if let error = error {
                print(error.localizedDescription)
            }
            if let fixtureData = fixtureData {
                let sortedFixtureData = fixtureData.result?.sorted { a, b in
                    let formatter = DateFormatter()
                    formatter.dateFormat = "yyyy-MM-dd"
                    if
                        let da = formatter.date(from: "\(a.event_date)"),
                        let db = formatter.date(from: "\(b.event_date)")
                    {
                        return da < db
                    }
                    return false
                }
                self.delegete?.didReceiveUpcomingFixtures(fixtureResponse: FixturesResponse(success: fixtureData.success,
                                                                                          result: sortedFixtureData))
            }else{
                
              
                self.delegete?.didReceiveUpcomingFixtures(
                       fixtureResponse: FixturesResponse(
                           success: 1,
                           result: nil))
                    }
        }
    }
    func getLatestFixtureDataFroModel(){
        let url = "https://apiv2.allsportsapi.com/\(Session.leagueType)/?met=Fixtures&APIkey=5ed2112ca25316743af4065ed4ab3866ed11bd08555311178237e77ea1e46342&leagueId=\(Session.leagueKey)&from=\(getDateAfterNumberDays(value: -8))&to=\(getDateAfterNumberDays(value: -1))"
        ApiHandler.getData(url: url) { (latestFixtureData:FixturesResponse?,error) in
            if let error = error {
                print(error.localizedDescription)
            }
              guard let latestFixtureData = latestFixtureData else {
                  return
              }
              self.delegete?.didReceiveLatestFixtures(fixtureResponse: latestFixtureData)
        }
    }
    func getStandingsDataFromModel(){
        let url = "https://apiv2.allsportsapi.com/football/?met=Standings&APIkey=5ed2112ca25316743af4065ed4ab3866ed11bd08555311178237e77ea1e46342&leagueId=\(Session.leagueKey)"
        ApiHandler.getData(url: url) { (response: StandingsResponse?, error) in
            if let error = error {
                    print(error.localizedDescription)
                    return
                }
                guard let data = response else { return }             
            self.delegete?.didRecieveStandings(standingsResponse: data)
        }
    }
}
