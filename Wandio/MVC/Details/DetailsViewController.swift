//
//  DetailsViewController.swift
//  Wandio
//
//  Created by Guga Valashvili on 9/27/20.
//  Copyright © 2020 Guga Valashvili. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    var matchId: String?
//    private var direPlayersListCollection: PlayersListCollectionViewControoler?
//    private var radiantPlayersListCollection: PlayersListCollectionViewControoler?
    
    @IBOutlet weak var matchDetails: UILabel!
    @IBOutlet weak var gameMode: UILabel!
    @IBOutlet weak var winTeam: UILabel!
    @IBOutlet weak var matchDuration: UILabel!
    @IBOutlet weak var radiontScore: UILabel!
    @IBOutlet weak var direScore: UILabel!
    @IBOutlet weak var first_blood_time: UILabel!
    
    
    private var network: Methods?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Match Details"
        self.network = .matches(id: matchId ?? "")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetch()
    }
    
    private func fetch() {
        self.startActivityIndicator()
        
        network?.fetch(Match.self) { [weak self] result in
            switch result {
            case .success(let item):
                self?.setupUI(item)
            case .failure(_):
                // ToDo: Error Page
                return
            }
            self?.stopActivityIndicator()
        }
        
    }
    
    private func setupUI(_ match: Match) {
        
        gameMode.text = "Game Mode: " + (match.gameMode!.name)
        
        if match.direWin == true {
            winTeam.text = "Win Team Is: Dire"
        } else {
            winTeam.text = "Win Team Is: Radiant"
        }
        
        matchDuration.text = "Match Duration is: " + "\(match.duration ?? 0)"
        first_blood_time.text = "Firs Blood Time is :" + "\(String(describing: match.firstBoolTime))"
        radiontScore.text = ("\(match.radiantScore ?? 0)")
        direScore.text = ("\(match.direScore ?? 0))")
        
        radiontScore.backgroundColor = match.radiantWin == true ? .green : .red
        direScore.backgroundColor = match.radiantWin == true ? .red : .green
        
//        self.direPlayersListCollection?.players = match.direPlayers ?? []
//        self.radiantPlayersListCollection?.players = match.radianPlayers ?? []
        
        
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let playersVC = segue.destination as? PlayersListCollectionViewControoler else { return }
//        if segue.identifier == "dire" {
//            self.direPlayersListCollection = playersVC
//        } else {
//            self.radiantPlayersListCollection = playersVC
//        }
//    }
}





