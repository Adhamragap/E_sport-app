//
//  HomeViewController.swift
//  Sportivo
//
//  Created by adham ragap on 13/09/2025.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var sportLabel: UILabel!
    
    @IBOutlet weak var sportsCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        sportLabel.textColor = UIColor(named: "MainColor")
//        sportLabel.font = UIFont(name: "Futura-Bold", size: 22)
        navigationItem.hidesBackButton = true
        sportsCollectionView.delegate = self
        sportsCollectionView.dataSource = self
        sportsCollectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
       
    }

}
extension HomeViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        
        return cell
    }
    
  
    
}
extension HomeViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let leaguesVC = LeaguesViewController(nibName: "LeaguesViewController", bundle: nil)
        if let nav = self.navigationController {
                nav.pushViewController(leaguesVC, animated: true)
            }
    }
}
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: sportsCollectionView.frame.width / 2 - 5, height: sportsCollectionView.frame.height / 2 - 10)
    }
}
