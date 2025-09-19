//
//  TeamsCell.swift
//  NibForProject
//
//  Created by Soha Elgaly on 19/09/2025.
//

import UIKit

class TeamsCell: UICollectionViewCell {
    @IBOutlet weak var teamImage: UIImageView!
    
    @IBOutlet weak var teamLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    setupUI()

    }
    private func setupUI() {
           teamImage.contentMode = .scaleAspectFill
           teamImage.clipsToBounds = true
           teamImage.layer.cornerRadius = 30 // half of 60 → circular
           teamLabel.textAlignment = .center
           teamLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        teamLabel.textColor = UIColor(named: "MainColor")
       }

       func configure(with team: TeamModel) {
           teamImage.image = team.logo
           teamLabel.text = team.name
       }

}
