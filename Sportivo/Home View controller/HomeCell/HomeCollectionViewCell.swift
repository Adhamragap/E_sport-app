//
//  HomeCollectionViewCell.swift
//  Sportivo
//
//  Created by adham ragap on 13/09/2025.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var sportStack: UIStackView!
    @IBOutlet weak var sportImage: UIImageView!
    @IBOutlet weak var sportLabelName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        sportStack.layer.borderWidth = 1
          updateColor()
        sportStack.layer.cornerRadius = sportStack.frame.height / 6
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            // أعد ضبط اللون بحيث يقرأ القيمة الجديدة للـ UIColor
           updateColor()
        }
    }
   
    private func updateColor (){
        sportStack.layer.borderColor = UIColor(named: "MainColor")?.cgColor
        sportLabelName.textColor = UIColor(named: "MainColor")
        sportImage.tintColor = UIColor(named: "MainColor")
    //    sportStack.layer.borderColor = UIColor(named: "MainColor")?.cgColor
    }

}
