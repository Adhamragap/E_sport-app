//
//  Compositional.swift
//  NibForProject
//
//  Created by Soha Elgaly on 18/09/2025.
//

import UIKit

class Compositional: UIViewController {

    @IBOutlet weak var CollectionView: UICollectionView!
    
    
    let teams: [TeamModel] = [
        TeamModel(logo: UIImage(named: "realmadrid"), name: "Real Madrid"),
        TeamModel(logo: UIImage(named: "liverpool"), name: "Liverpool"),
        TeamModel(logo: UIImage(named: "barcelona"), name: "Barcelona")
    ]
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
        let favoriteButton = UIBarButtonItem(
            image: UIImage(systemName: "heart"),
            style: .plain,
            target: self,
            action: #selector(favoriteTapped)
        )
        navigationItem.rightBarButtonItem = favoriteButton

            setupCollectionView()
        }
    @objc private func favoriteTapped() {
  
        if navigationItem.rightBarButtonItem?.image == UIImage(systemName: "heart") {
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "heart.fill")
            navigationItem.rightBarButtonItem?.tintColor = .systemRed
        } else {
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "heart")
            navigationItem.rightBarButtonItem?.tintColor = .label
        }
    }
        private func setupCollectionView() {
            CollectionView.register(UINib(nibName: "EventCell", bundle: nil), forCellWithReuseIdentifier: "EventCell")
            
            
            
            CollectionView.register(UINib(nibName: "SectionHeader", bundle: nil),
                                    forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                    withReuseIdentifier: "SectionHeader")
            CollectionView.register(UINib(nibName: "TeamsCell", bundle: nil),
                                    forCellWithReuseIdentifier: "TeamsCell")

            CollectionView.collectionViewLayout = createLayout()
            CollectionView.dataSource = self
            CollectionView.delegate = self
        }

    private func createLayout() -> UICollectionViewCompositionalLayout {
     return  UICollectionViewCompositionalLayout { sectionIndex, environment in
            switch sectionIndex {
            case 0 :
                return self.liveEvents()
            case 1 :
                return self.upComing()
            default:
                return self.teamsGrid()
            }
            
        }
       
        
    }
    func liveEvents() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .absolute(190))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),
                                               heightDimension: .absolute(190))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        
        // Header
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                heightDimension: .absolute(60))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        section.boundarySupplementaryItems = [header]
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16)

        return section
    }
    func upComing() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .absolute(200))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)

        // Header
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                heightDimension: .absolute(60))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        section.boundarySupplementaryItems = [header]

        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16)

        return section
    }
    func teamsGrid() -> NSCollectionLayoutSection {
  
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0 / 3.0),
            heightDimension: .absolute(200)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)

       
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(200)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

   
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)

  
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(60)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        section.boundarySupplementaryItems = [header]
        section.orthogonalScrollingBehavior = .groupPagingCentered
        return section
    }

    }


extension Compositional: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0, 1:
            let cell = CollectionView.dequeueReusableCell(
                withReuseIdentifier: "EventCell",
                for: indexPath
            ) as! EventCell

            let model = EventModel(
                leftTeamImage: UIImage(named: "realmadrid"),
                rightTeamImage: UIImage(named: "liverpool"),
                score: nil,
                date: Date(),
                competition1: "Real Madrid",
                competition2: "Liverpool"
            )
            cell.configure(with: model)
            return cell

        case 2:
            let cell = CollectionView.dequeueReusableCell(
                withReuseIdentifier: "TeamsCell",
                for: indexPath
            ) as! TeamsCell

            let team = teams[indexPath.item]
            cell.configure(with: team)
            return cell

        default:
            fatalError("Unexpected section")
        }
    }

        
        func collectionView(_ collectionView: UICollectionView,
                            viewForSupplementaryElementOfKind kind: String,
                            at indexPath: IndexPath) -> UICollectionReusableView {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader",for: indexPath) as! SectionHeader
            
            if indexPath.section == 0 {
                header.sectionLabel.text = "Upcoming Events"
            } else if indexPath.section == 1 {
                header.sectionLabel.text = "Latest Events"
            } else {
                header.sectionLabel.text = "Teams"
            }
            
            return header
        }
    }

