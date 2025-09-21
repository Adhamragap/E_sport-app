//
//  TeamsCell.swift
//  NibForProject
//
//  Created by Soha Elgaly on 19/09/2025.
//

import UIKit

class TeamsCell: UICollectionViewCell {
    @IBOutlet weak var teamImage: UIImageView!
    
    @IBOutlet weak var teamStandingLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    setupUI()

    }
    private func setupUI() {
//           teamImage.contentMode = .scaleAspectFill
//           teamImage.clipsToBounds = true
//           teamImage.layer.cornerRadius = 30 // half of 60 → circular
//           teamLabel.textAlignment = .center
           teamLabel.textColor = UIColor(named: "MainColor")
        teamStandingLabel.textColor = UIColor(named: "MainColor")
       }

       func configure(with team: Standing) {
           teamImage.sd_setImage(
            with: URL(string: team.team_logo ),
               placeholderImage: UIImage(named: "ball")
           )
           teamLabel.text = team.standing_team
           teamStandingLabel.text = "\(team.standing_place)"
       }

}
