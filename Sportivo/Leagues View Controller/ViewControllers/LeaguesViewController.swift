//
//  LeaguesViewController.swift
//  Sportivo
//
//  Created by adham ragap on 13/09/2025.
//

import UIKit

class LeaguesViewController: UIViewController{
   
    

    @IBOutlet weak var leaguesLabel: UILabel!
    @IBOutlet weak var leaguesTableView: UITableView!
    var leaguesArray = [LeagueItem]()
    var lp : LeaguePresenter!
    var leagueName:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        leaguesLabel.textColor = UIColor(named: "MainColor")
        leaguesTableView.delegate = self
        leaguesTableView.dataSource = self
        leaguesTableView.register(UINib(nibName: "LeaguesTableViewCell", bundle: nil), forCellReuseIdentifier: "LeaguesTableViewCell")
      //  lp.leagueName = Session.leagueType
        lp  = LeaguePresenter(sendLeagueToView:self)
        lp?.getDataFromRemote()
    }
}
extension LeaguesViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaguesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LeaguesTableViewCell", for: indexPath) as? LeaguesTableViewCell else {return UITableViewCell()}
        cell.configure(league: leaguesArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
}
extension LeaguesViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let leagueVC = Compositional.init(nibName: "Compositional", bundle: nil)
        navigationController?.pushViewController(leagueVC, animated: true)
    }
        
}
extension LeaguesViewController:SendLeagueToViewProtocol {
    func sendLeague(league: League) {
        leaguesArray = league.result
        DispatchQueue.main.async {
            self.leaguesTableView.reloadData()
        }
    }
}
