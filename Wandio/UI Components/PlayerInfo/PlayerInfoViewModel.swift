//
//  PlayerInfoViewModel.swift
//  Wandio
//
//  Created by Guga Valashvili on 10/8/20.
//  Copyright © 2020 Guga Valashvili. All rights reserved.
//

import Foundation

protocol PlayerInfoDisplay {
    func playerInfoViewModel(_ viewModel: PlayerInfoViewModel, stratLoader: Bool)
    func playerInfoViewModel(_ viewModel: PlayerInfoViewModel, didFetch player: Player)
    func playerInfoViewModel(_ viewModel: PlayerInfoViewModel, didFail error: Error)
}

class PlayerInfoViewModel {
    var dislpay: PlayerInfoDisplay?
    var playerID: String?
    
    func willAppear(){
        fetch()
    }
    
    private func fetch() {
        self.dislpay?.playerInfoViewModel(self, stratLoader: true)
        Methods.players(id: playerID ?? "").fetch(Player.self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let item):
                self.dislpay?.playerInfoViewModel(self, didFetch: item)
            case .failure(let error):
                self.dislpay?.playerInfoViewModel(self, didFail: error)
            }
            self.dislpay?.playerInfoViewModel(self, stratLoader: false)
        }
    }
}
