//
//  Compositional.swift
//  NibForProject
//
//  Created by Soha Elgaly on 18/09/2025.
//

import UIKit

class Compositional: UIViewController {

    @IBOutlet weak var CollectionView: UICollectionView!
    
    
    var upComingArray = [Match]()
    var LatestArray = [Match]()
    var standingsArray = [Standing]()
    var presenter : FixtureLeaguePresenter?
    override func viewDidLoad() {
            super.viewDidLoad()
        title = Session.leagueName
        presenter = FixtureLeaguePresenter(delegete: self)
        presenter?.getUpComingFixtureDataFromModel()
        presenter?.getLatestFixtureDataFroModel()
        presenter?.getStandingsDataFromModel()
        print("teams count = \(upComingArray.count)")
        let favoriteButton = UIBarButtonItem(
            image: UIImage(systemName: "heart"),
            style: .plain,
            target: self,
            action: #selector(favoriteTapped))
        
        favoriteButton.tintColor = UIColor(named:"MainColor")
        navigationItem.rightBarButtonItem = favoriteButton

            setupCollectionView()
        }
   
    @objc private func favoriteTapped() {
        if navigationItem.rightBarButtonItem?.image == UIImage(systemName: "heart") {
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "heart.fill")
            navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "MainColor")
        } else {
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "heart")
            navigationItem.rightBarButtonItem?.tintColor = .label
        }
    }
   
        private func setupCollectionView() {
            CollectionView.register(UINib(nibName: "EventCell", bundle: nil), forCellWithReuseIdentifier: "EventCell")
            
           
            CollectionView.register(UINib(nibName: "ScoreCell", bundle: nil), forCellWithReuseIdentifier: "ScoreCell")
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
        section.interGroupSpacing = 8
       // section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16)

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

//        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)

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
        switch section {
        case 0 :
            return upComingArray.count
        case 1 :
            return LatestArray.count
        case 2 :
            return standingsArray.count
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = CollectionView.dequeueReusableCell(
                withReuseIdentifier: "EventCell",
                for: indexPath
            ) as! EventCell

            cell.configure(with: upComingArray[indexPath.item] )
            return cell
        case 1 :
            let cell = CollectionView.dequeueReusableCell(
                withReuseIdentifier: "ScoreCell",
                for: indexPath
            ) as! ScoreCell

            cell.configure(match: LatestArray[indexPath.item] )
            return cell
        case 2:
            let cell = CollectionView.dequeueReusableCell(
                withReuseIdentifier: "TeamsCell",
                for: indexPath
            ) as! TeamsCell

            let team = standingsArray[indexPath.item]
             cell.configure(with: team)
            return cell

        default:
            fatalError("Unexpected section")
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0 :
            print("section 1 clicked")
        case 1:
            print("section 2 clicked")
        case 2 :
            print("section 3 clicked")
            let vc = TeamDetailsViewController(nibName: "TeamDetailsViewController", bundle: nil)
            Session.teamKey = standingsArray[indexPath.item].team_key
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            return
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
extension Compositional:FixtureLeaguePresenterProtocol{
    func didRecieveStandings(standingsResponse: StandingsResponse) {
        standingsArray = standingsResponse.result.total
        if standingsArray.count == 0 {
            standingsArray = [Standing(standing_place: 0, standing_place_type: "", standing_team: "", standing_P: 0, standing_W: 0, standing_D: 0, standing_L: 0, standing_F: 0, standing_A: 0, standing_GD: 0, standing_PTS: 0, team_key: 0, league_key: 0, league_season: "", league_round: "", standing_updated: "", fk_stage_key: 0, stage_name: "", team_logo: "", standing_LP: 0, standing_WP: 0)]
        }
        DispatchQueue.main.async {
            self.CollectionView.reloadData()
        }
    }
    
    func didReceiveLatestFixtures(fixtureResponse: FixturesResponse) {
        LatestArray = fixtureResponse.result ??  [Match(
            event_key: 0,
            event_date: "",
            event_time: "",
            event_home_team: "",
            event_away_team: "",
            league_name: "",
            league_key: 0,
            home_team_logo: "",
            away_team_logo: "",
            event_final_result: ""
        )]
       
        DispatchQueue.main.async {
            self.CollectionView.reloadData()
        }
    }
    
    func didReceiveUpcomingFixtures(fixtureResponse: FixturesResponse) {
        upComingArray = fixtureResponse.result ?? [Match(
            event_key: 0,
            event_date: "",
            event_time: "",
            event_home_team: "",
            event_away_team: "",
            league_name: "",
            league_key: 0,
            home_team_logo: "",
            away_team_logo: "",
            event_final_result: ""
        )]
       
        DispatchQueue.main.async {
            self.CollectionView.reloadData()
        }
    }
    
    
}
