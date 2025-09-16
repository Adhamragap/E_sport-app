//
//  HomePresenter.swift
//  Sportivo
//
//  Created by adham ragap on 16/09/2025.
//

import Foundation
class HomePresenter {
    func getArray ()->[SportItem]{
        var  sportsArray = [
            SportItem(name: "Football",   apiKeyWord: "football",   imageName: "football"),
            SportItem(name: "Basketball", apiKeyWord: "basketball", imageName: "basketball"),
            SportItem(name: "Cricket",    apiKeyWord: "cricket",    imageName: "cricket"),
            SportItem(name: "Tennis",     apiKeyWord: "tennis",     imageName: "tennis")
        ]
        return sportsArray
    }
}
