//
//  LeaguesTableViewCell.swift
//  Sportivo
//
//  Created by adham ragap on 13/09/2025.
//

import UIKit
import SDWebImage

class LeaguesTableViewCell: UITableViewCell {
   
    
    @IBOutlet weak var leagueNameLabel: UILabel!
    @IBOutlet weak var leagueImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
      
        leagueImage.layer.cornerRadius = leagueImage.frame.height / 2
        leagueNameLabel.textColor = UIColor(named: "MainColor")
    }
    func configure (league:LeagueItem){
        leagueNameLabel.text = league.league_name

        guard let logo = league.league_logo else{return  leagueImage.image = UIImage(named: "ball")}
        let logoHeight = leagueImage.frame.height
        let logoWidth = leagueImage.frame.width
        leagueImage.sd_setImage(
            with: URL(string: "\(logo)?width=\(logoHeight)&height=\(logoWidth)"),
            placeholderImage: UIImage(named: "ball")
        )
       
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
