//
//  FavoriteViewController.swift
//  Sportivo
//
//  Created by adham ragap on 16/09/2025.
//

import UIKit

class FavoriteViewController: UIViewController {

    @IBOutlet weak var myFavoriteLeague: UILabel!
    @IBOutlet weak var favoriteTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        myFavoriteLeague.textColor = UIColor(named: "MainColor")
        favoriteTableView.register(UINib(nibName: "LeaguesTableViewCell", bundle: nil), forCellReuseIdentifier: "LeaguesTableViewCell")
        //favoriteTableView.delegate = self
        favoriteTableView.dataSource = self
    }


   

}
extension FavoriteViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LeaguesTableViewCell", for: indexPath) as? LeaguesTableViewCell else {return UITableViewCell()}
        
        return cell
    }
    
    
}
