//
//  EventCell.swift
//  NibForProject
//
//  Created by Soha Elgaly on 18/09/2025.
//

import UIKit

class EventCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var leftLogoImageView: UIImageView!
    
    @IBOutlet weak var rightLogoImageView: UIImageView!
    
    @IBOutlet weak var centerLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var leftCompetitionLabel: UILabel!
    
    @IBOutlet weak var rightCompetitionLabel: UILabel!
    
    
    private lazy var dateFormatter: DateFormatter = {
            let f = DateFormatter()
            f.dateFormat = "yyyy-MM-dd"
            return f
        }()

        private lazy var timeFormatter: DateFormatter = {
            let f = DateFormatter()
            f.dateFormat = "HH:mm"
            return f
        }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = containerView.frame.height / 9
               containerView.layer.cornerCurve = .continuous
               containerView.layer.masksToBounds = true
        
            
        // Dynamic Type
                centerLabel.font = UIFont.preferredFont(forTextStyle: .title3)
                centerLabel.adjustsFontForContentSizeCategory = true
                dateLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
                dateLabel.textColor = UIColor(named: "MainColor")
                timeLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
                timeLabel.textColor = UIColor(named: "MainColor")
                leftCompetitionLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
                leftCompetitionLabel.textColor = UIColor(named: "MainColor")
                rightCompetitionLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
                rightCompetitionLabel.textColor = UIColor(named: "MainColor")
    }

    override func layoutSubviews() {
            super.layoutSubviews()
            // make logos circular (safe because widths are constrained)
            leftLogoImageView.layer.cornerRadius = leftLogoImageView.bounds.width / 2
            rightLogoImageView.layer.cornerRadius = rightLogoImageView.bounds.width / 2
        }

        override func prepareForReuse() {
            super.prepareForReuse()
            leftLogoImageView.image = nil
            rightLogoImageView.image = nil
            centerLabel.text = nil
            dateLabel.text = nil
            timeLabel.text = nil
            leftCompetitionLabel.text = nil
            rightCompetitionLabel.text = nil
          
        }
    
    
    func configure(with model: EventModel) {
            leftLogoImageView.image = model.leftTeamImage ?? UIImage(systemName: "realmadrid")
            rightLogoImageView.image = model.rightTeamImage ?? UIImage(systemName: "liverpool")

            if let score = model.score, !score.isEmpty {
                centerLabel.text = score
                centerLabel.textColor = .systemGreen
            } else {
                centerLabel.text = "Vs."
                centerLabel.textColor = .systemGreen
            }

      
        dateLabel.text = dateFormatter.string(from: model.date!)
        timeLabel.text = timeFormatter.string(from: model.date!)

            leftCompetitionLabel.text = model.competition1
            rightCompetitionLabel.text = model.competition2

            
        }
}
