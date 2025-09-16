//
//  HomeTabBarViewController.swift
//  Sportivo
//
//  Created by adham ragap on 16/09/2025.
//

import UIKit

class HomeTabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        tabBarIntiliaze()
    }
    func tabBarIntiliaze (){
        let homeVC = HomeViewController(nibName: "HomeViewController", bundle: nil)
        homeVC.tabBarItem = UITabBarItem(title: "sports",
                                          image: UIImage(systemName: "sportscourt"),
                                          selectedImage: UIImage(systemName: "sportscourt.fill"))

        let favoriteVC = FavoriteViewController(nibName: "FavoriteViewController", bundle: nil)
        favoriteVC.tabBarItem = UITabBarItem(title: "Favorites",
                                              image: UIImage(systemName: "heart"),
                                              selectedImage: UIImage(systemName: "heart.fill"))
        let homeNav = UINavigationController(rootViewController: homeVC)
        let favoriteNav = UINavigationController(rootViewController:favoriteVC)
        UITabBar.appearance().tintColor = UIColor(named: "MainColor")
        UITabBar.appearance().unselectedItemTintColor = UIColor(named: "MainColor")
        self.viewControllers = [homeNav, favoriteNav]
    }
}
