//
//  PlayersListCollectionViewModel.swift
//  Wandio
//
//  Created by Guga Valashvili on 10/9/20.
//  Copyright © 2020 Guga Valashvili. All rights reserved.
//

import Foundation

protocol PlayersListCollectionDisplay {
    func playersListCollectionViewModelReloadData(_ viewModel: PlayersListCollectionViewModel)
    func playersListCollectionViewModel(_ viewModel: PlayersListCollectionViewModel, open player: Int)
}

class PlayersListCollectionViewModel {
    var display: PlayersListCollectionDisplay?
    
    private var players: [Players] = [] {
        didSet {
            display?.playersListCollectionViewModelReloadData(self)
        }
    }
    
    func set(players: [Players]) {
        self.players = players
    }
    
    func count() -> Int {
        players.count
    }
    
    func player(at index: Int) -> Players? {
        if players.count > index, index >= 0 {
            return players[index]
        }
        return nil
    }
    
    func didSelect(at index: Int) {
        if let playeId = player(at: index)?.accountId {
            display?.playersListCollectionViewModel(self, open: playeId)
         }
     }
}
