//
//  MatchDetailsViewController.swift
//  Wandio
//
//  Created by Guga Valashvili on 10/7/20.
//  Copyright © 2020 Guga Valashvili. All rights reserved.
//

import UIKit

class MatchDetailsViewController: UIViewController {
    
    @IBOutlet weak var gameMode: UILabel!
    @IBOutlet weak var winTeam: UILabel!
    @IBOutlet weak var matchDuration: UILabel!
    @IBOutlet weak var radiontScore: UILabel!
    @IBOutlet weak var direScore: UILabel!
    @IBOutlet weak var first_blood_time: UILabel!
    @IBOutlet weak var direPlayersView: UIView!
    @IBOutlet weak var radiantPlayerView: UIView!
    
    var viewModel: MatchDetailsViewModel = .init()
    
    private var direPlayersViewModel: PlayersListCollectionViewModel?
    private var radiantPlayersViewModel: PlayersListCollectionViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.dislpay = self
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.willAppear()
    }
    
    private func setupUI() {
        let vc = PlayersListCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        self.insertSubController(childVC: vc, inView: direPlayersView)
        self.direPlayersViewModel = vc.viewModel
        
        let rvc = PlayersListCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        self.insertSubController(childVC: rvc, inView: radiantPlayerView)
        self.radiantPlayersViewModel = rvc.viewModel
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
        
        direPlayersViewModel?.set(players: match.direPlayers ?? [])
        radiantPlayersViewModel?.set(players: match.radianPlayers ?? [])
    }
}

extension MatchDetailsViewController: MatchDetailsDisplay {
    func matchDetailsViewModel(_ viewModel: MatchDetailsViewModel, stratLoader: Bool) {
        stratLoader ? startActivityIndicator() : stopActivityIndicator()
    }
    
    func matchDetailsViewModel(_ viewModel: MatchDetailsViewModel, didFetch match: Match) {
        setupUI(match)
    }
    
    func matchDetailsViewModel(_ viewModel: MatchDetailsViewModel, didFail error: Error) {
        self.view.backgroundColor = .red
        self.gameMode.text = error.localizedDescription
    }
}
