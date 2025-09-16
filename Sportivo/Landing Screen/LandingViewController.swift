//
//  LandingViewController.swift
//  Sportivo
//
//  Created by adham ragap on 13/09/2025.
//

import UIKit

class LandingViewController: UIViewController {
    @IBOutlet weak var labelS: UILabel!
    var charIndex = 0.0
    // ⚡️Sportivo
    override func viewDidLoad() {
        super.viewDidLoad()
        labelS.text = ""
        labelS.textColor = UIColor(named: "MainColor")
        let titleText = "SPORTIVO🥇"
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.2 * charIndex , repeats: false) { timer in
                self.labelS.text?.append(letter)
            }
            charIndex += 1
           
        }
        let totalDuration = 0.2 * charIndex
        DispatchQueue.main.asyncAfter(deadline: .now() + totalDuration) {
                self.goToNextScreen()
            }
    }
    func goToNextScreen() {
        let homeTabBar = HomeTabBarViewController()
        navigationController?.pushViewController(homeTabBar, animated: true)
        }


   
}
