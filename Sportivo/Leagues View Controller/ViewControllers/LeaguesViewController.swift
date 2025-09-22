//
//  LeaguesViewController.swift
//  Sportivo
//
//  Created by adham ragap on 13/09/2025.
//

import UIKit
import NVActivityIndicatorView

class LeaguesViewController: UIViewController{
   
    
    @IBOutlet weak var loader: NVActivityIndicatorView!
    @IBOutlet weak var leaguesLabel: UILabel!
    @IBOutlet weak var leaguesTableView: UITableView!
    var leaguesArray = [LeagueItem]()
    var lp : LeaguePresenter!
    var leagueName:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkInternert()
        loader.type = .pacman
        loader.color = UIColor(named: "MainColor")!
        loader.startAnimating()
     
        leaguesLabel.textColor = UIColor(named: "MainColor")
        leaguesTableView.delegate = self
        leaguesTableView.dataSource = self
        leaguesTableView.register(UINib(nibName: "LeaguesTableViewCell", bundle: nil), forCellReuseIdentifier: "LeaguesTableViewCell")
      //  lp.leagueName = Session.leagueType
       
    }
    private func checkInternert(){
        let check = CheckInternet()
        if check.Connection() {
            lp  = LeaguePresenter(sendLeagueToView:self)
            lp?.getDataFromRemote()
      //  https:api.themoviedb.org/3/discover/movie?api_key=0bb6c7c539136cb79804f10c8df0f767&language=en
        }else {
            let alert = UIAlertController(title: "Offline", message: "You are offline Kindly check your internet connection.", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
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
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = Compositional(nibName: "Compositional", bundle: nil)
        Session.leagueKey = leaguesArray[indexPath.row].league_key
        Session.leagueName = leaguesArray[indexPath.row].league_name
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension LeaguesViewController:SendLeagueToViewProtocol {
    func sendLeague(league: League) {
       
        leaguesArray = league.result
        DispatchQueue.main.async {
            self.loader.stopAnimating()
            self.leaguesTableView.reloadData()
        }
    }
}

