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
    private var direPlayersListCollection: PlayersListCollectionViewControoler?
    private var radiantPlayersListCollection: PlayersListCollectionViewControoler?
    
    @IBOutlet weak var matchDetails: UILabel!
    @IBOutlet weak var gameMode: UILabel!
    @IBOutlet weak var winTeam: UILabel!
    @IBOutlet weak var matchDuration: UILabel!
    @IBOutlet weak var radiontScore: UILabel!
    @IBOutlet weak var direScore: UILabel!
    @IBOutlet weak var first_blood_time: UILabel!
    
    
    private var network: FetchMatchies?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Match Details"
        self.network = FetchMatchies(id: matchId ?? "")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetch()
    }
    
    private func fetch() {
        self.startActivityIndicator()
        network?.fetch { [weak self] item in
            guard let item = item else { return }
            self?.setupUI(item)
            self?.stopActivityIndicator()
        }
    }
    
    private func setupUI(_ match: Match) {
        
        gameMode.text = "Game Mode: " + (match.game_mode!.name)
        
        if match.dire_win == true {
            winTeam.text = "Win Team Is: Dire"
        } else {
            winTeam.text = "Win Team Is: Radiant"
        }
        
        matchDuration.text = "Match Duration is: " + "\(String(describing: match.duration!))"
        first_blood_time.text = "Firs Blood Time is :" + "\(String(describing: match.first_bool_time))"
        radiontScore.text = ("\(String(describing: match.radiant_score!))")
        direScore.text = ("\(String(describing: match.dire_score!))")
        
        radiontScore.backgroundColor = match.radiant_win == true ? .green : .red
        direScore.backgroundColor = match.radiant_win == true ? .red : .green
        
        self.direPlayersListCollection?.players = match.direPlayers ?? []
        self.radiantPlayersListCollection?.players = match.radianPlayers ?? []
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let playersVC = segue.destination as? PlayersListCollectionViewControoler else { return }
        if segue.identifier == "dire" {
            self.direPlayersListCollection = playersVC
        } else {
            self.radiantPlayersListCollection = playersVC
        }
    }
    
    
    
}





