//
//  LeaguesTableViewCell.swift
//  Sportivo
//
//  Created by adham ragap on 13/09/2025.
//

import UIKit

class LeaguesTableViewCell: UITableViewCell {

    @IBOutlet weak var leagueImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        leagueImage.layer.cornerRadius = leagueImage.frame.size.width / 2
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
