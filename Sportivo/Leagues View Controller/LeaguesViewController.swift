//
//  LeaguesViewController.swift
//  Sportivo
//
//  Created by adham ragap on 13/09/2025.
//

import UIKit

class LeaguesViewController: UIViewController {

    @IBOutlet weak var leaguesLabel: UILabel!
    @IBOutlet weak var leaguesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        leaguesLabel.textColor = UIColor(named: "MainColor")
        leaguesTableView.delegate = self
        leaguesTableView.dataSource = self
        leaguesTableView.register(UINib(nibName: "LeaguesTableViewCell", bundle: nil), forCellReuseIdentifier: "LeaguesTableViewCell")
    }
}
extension LeaguesViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeaguesTableViewCell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
extension LeaguesViewController:UITableViewDelegate{
        
}
