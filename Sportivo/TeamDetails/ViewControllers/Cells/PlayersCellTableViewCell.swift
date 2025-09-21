//
//  PlayersCellTableViewCell.swift
//  Sportivo
//
//  Created by adham ragap on 21/09/2025.
//

import UIKit

class PlayersCellTableViewCell: UITableViewCell {

    @IBOutlet weak var cellStack: UIStackView!
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var pirthDateLabel: UILabel!
    @IBOutlet weak var goalsLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        cellStack.layer.cornerRadius = cellStack.frame.height / 6
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(with player :Player){
        nameLabel.text = player.player_name ?? "no name"
        ageLabel.text = player.player_age ?? "No data"
        numberLabel.text =  player.player_number ?? "no data"
        typeLabel.text = player.player_type ?? ""
        playerImage.sd_setImage(
            with: URL(string: player.player_image ?? ""),
            placeholderImage: UIImage(systemName: "person.fill")
        )
        pirthDateLabel.text = player.player_birthdate ?? "no data"
        if  player.player_goals  == "" {
            goalsLabel.text = "0"
        }else {
            goalsLabel.text = player.player_goals ?? "No goals"
        }
       
    }
}
