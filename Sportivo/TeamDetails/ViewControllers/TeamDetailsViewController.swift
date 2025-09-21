//
//  TeamDetailsViewController.swift
//  Sportivo
//
//  Created by adham ragap on 21/09/2025.
//

import UIKit

class TeamDetailsViewController: UIViewController {
   var playerArray = [Player]()
    @IBOutlet weak var teamPhoto: UIImageView!
   
    @IBOutlet weak var playersTableView: UITableView!
    @IBOutlet weak var coachNameLabel: UILabel!
    var presenter : TeamsPresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        playersTableView.register(UINib(nibName: "PlayersCellTableViewCell", bundle: nil), forCellReuseIdentifier: "PlayersCellTableViewCell")
        presenter = TeamsPresenter(delegte: self)
        presenter?.getTeamsFromApi()
        playersTableView.delegate = self
        playersTableView.dataSource = self
        coachNameLabel.textColor = UIColor(named: "MainColor")
      
    }


}
extension  TeamDetailsViewController:UITableViewDelegate{
    
}
extension TeamDetailsViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "PlayersCellTableViewCell", for: indexPath) as? PlayersCellTableViewCell else {return UITableViewCell()}
        cell.configure(with: playerArray[indexPath.row])
        
        return cell
    }
    
   
}
extension TeamDetailsViewController:TeamsPresenterProtocol{
    func sendTeam(team: TeamDetailsResponse) {
        playerArray = team.result[0].players
       
       
        DispatchQueue.main.async {
            self.playersTableView.reloadData()
            self.title = team.result[0].team_name
            self.coachNameLabel.text = team.result[0].coaches[0].coach_name ?? "no coach name"
            self.teamPhoto.sd_setImage(
                with: URL(string: team.result[0].team_logo),
                placeholderImage: UIImage(named: "ball")
            )
        }
    }
    
    
}
