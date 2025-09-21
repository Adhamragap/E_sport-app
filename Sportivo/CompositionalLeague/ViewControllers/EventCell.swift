//
//  EventCell.swift
//  NibForProject
//
//  Created by Soha Elgaly on 18/09/2025.
//

import UIKit
import SDWebImage

class EventCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var leftLogoImageView: UIImageView!
    
    @IBOutlet weak var rightLogoImageView: UIImageView!
    
    @IBOutlet weak var centerLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var leftCompetitionLabel: UILabel!
    
    @IBOutlet weak var rightCompetitionLabel: UILabel!
    
    

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = containerView.frame.height / 9
               containerView.layer.cornerCurve = .continuous
               containerView.layer.masksToBounds = true
        centerLabel.text = "VS"
        centerLabel.textColor = UIColor(named: "MainColor")
        
        // Logos
//           leftLogoImageView.contentMode = .scaleAspectFit
//           rightLogoImageView.contentMode = .scaleAspectFit
//           leftLogoImageView.clipsToBounds = true
//           rightLogoImageView.clipsToBounds = true
//        
        
        
//        // Dynamic Type
//                centerLabel.font = UIFont.preferredFont(forTextStyle: .title3)
//                centerLabel.adjustsFontForContentSizeCategory = true
//                dateLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
//                timeLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
//                leftCompetitionLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
//                rightCompetitionLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
    }

    override func layoutSubviews() {
            super.layoutSubviews()
          
         //   leftLogoImageView.layer.cornerRadius = leftLogoImageView.bounds.width / 2
        //    rightLogoImageView.layer.cornerRadius = rightLogoImageView.bounds.width / 2
        }

        override func prepareForReuse() {
            super.prepareForReuse()
           
          
        }
    
    
    func configure(with model: Match) {
        leftLogoImageView.sd_setImage(
            with: URL(string: model.home_team_logo ?? "" ),
            placeholderImage: UIImage(named: "ball")
        )
        
        rightLogoImageView.sd_setImage(
            with: URL(string: model.away_team_logo ?? ""),
            placeholderImage: UIImage(named: "ball")
        )
            

//
        dateLabel.text = model.event_date
        timeLabel.text = model.event_time

        leftCompetitionLabel.text = model.event_home_team
        rightCompetitionLabel.text = model.event_away_team
        leftCompetitionLabel.textColor = UIColor(named: "MainColor")
        rightCompetitionLabel.textColor = UIColor(named: "MainColor")
        
            
        }
}
