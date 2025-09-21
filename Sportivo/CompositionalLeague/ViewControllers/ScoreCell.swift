//
//  ScoreCell.swift
//  Sportivo
//
//  Created by adham ragap on 21/09/2025.
//

import UIKit

class ScoreCell: UICollectionViewCell {

    @IBOutlet weak var leftTeamImage: UIImageView!
    @IBOutlet weak var leftTeamLabel: UILabel!
    @IBOutlet weak var leftTeamLabelScore: UILabel!
   
    @IBOutlet weak var matchDateLabel: UILabel!
    @IBOutlet weak var matchTimeLabel: UILabel!
    @IBOutlet weak var rightTeamimage: UIImageView!
    @IBOutlet weak var rightTeamLabel: UILabel!
    @IBOutlet weak var vsLabel: UILabel!
    @IBOutlet weak var cellStack: UIStackView!
    override func awakeFromNib() {
        super.awakeFromNib()
        cellStack.layer.cornerRadius = cellStack.frame.height / 9
        vsLabel.textColor = UIColor(named: "MainColor")
        leftTeamLabel.textColor = UIColor(named: "MainColor")
        rightTeamLabel.textColor = UIColor(named: "MainColor")
        
    }

    
    func configure(match:Match){
        leftTeamLabel.text = match.event_home_team
        rightTeamLabel.text = match.event_away_team
        leftTeamImage.sd_setImage(
            with: URL(string: match.home_team_logo ?? "" ),
            placeholderImage: UIImage(named: "ball")
        )
        rightTeamimage.sd_setImage(
            with: URL(string: match.away_team_logo ?? "" ),
            placeholderImage: UIImage(named: "ball")
        )
        matchDateLabel.text = match.event_date
        matchTimeLabel.text = match.event_time
        leftTeamLabelScore.text = match.event_final_result
        
        
    }
}
